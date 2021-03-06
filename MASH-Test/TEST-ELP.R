#       __  ______   _____ __  __      __  ______   __________  ____
#      /  |/  /   | / ___// / / /     /  |/  /   | / ____/ __ \/ __ \
#     / /|_/ / /| | \__ \/ /_/ /_____/ /|_/ / /| |/ /   / /_/ / / / /
#    / /  / / ___ |___/ / __  /_____/ /  / / ___ / /___/ _, _/ /_/ /
#   /_/  /_/_/  |_/____/_/ /_/     /_/  /_/_/  |_\____/_/ |_|\____/
#
#   MASH-MACRO
#   Testing Ground
#   August 22, 2017
#
###############################################################################

rm(list=ls());gc()
library(MASHmacro)
library(MASHmicro)


###############################################################################
# John Marshall EL4P
###############################################################################

N_genotypes = 1

el4p = MASHmicro::EL4P$new(K = 100,dEgg = 2,dLarva = 2,dPupae = 2,muEgg = 0.1,muLarva = 0.01,muPupae = 0.1,N_genotypes = N_genotypes)

# el4p$addBatch_EL4P(batch = c(10,10))
# el4p$get_all(lag = TRUE)

g = 1/10
v = 20
f = 0.3
M = 100

Ehist = vector(mode="list",length=1000)
L1hist = vector(mode="list",length=1000)
L2hist = vector(mode="list",length=1000)
L3hist = vector(mode="list",length=1000)
L4hist = vector(mode="list",length=1000)
Phist = vector(mode="list",length=1000)
lambdahist = vector(mode="list",length=1000)

tNow = 1
while(tNow <= 1000){
  el4p$addBatch_EL4P(batch = (f*v*M))
  el4p$oneDay_EL4P()
  Ehist[[tNow]] = el4p$get_E()
  L1hist[[tNow]] = el4p$get_L1()
  L2hist[[tNow]] = el4p$get_L2()
  L3hist[[tNow]] = el4p$get_L3()
  L4hist[[tNow]] = el4p$get_L4()
  Phist[[tNow]] = el4p$get_P()
  lambdahist[[tNow]] = el4p$get_lambda()
  el4p$clear_lambda()
  M = lambdahist[[tNow]] - g*M
  
  tNow = tNow + 1
}

Eout = Reduce(f = rbind,x = Ehist)
Eout = rowSums(Eout)

L1out = Reduce(f = rbind,x = L1hist)
L1out = rowSums(L1out)

L2out = Reduce(f = rbind,x = L2hist)
L2out = rowSums(L2out)

L3out = Reduce(f = rbind,x = L3hist)
L3out = rowSums(L3out)

L4out = Reduce(f = rbind,x = L4hist)
L4out = rowSums(L4out)

Pout = Reduce(f = rbind,x = Phist)
Pout = rowSums(Pout)

lambdaout = Reduce(f = rbind,x = lambdahist)
lambdaout = rowSums(lambdaout)

matplot(cbind(Eout,L1out,L2out,L3out,L4out,Pout,lambdaout),type="l",lty=1)

###############################################################################
#
# EL4P R VS C++ HEAD TO HEAD
# ITS TIME TO D-D-D-D-D-D-DUEL
#
###############################################################################


tGrain = 24
v = 20
f = (0.3)/tGrain
g = (1/10)/tGrain
alpha=(0.9)/tGrain
gamma=(0.1)/tGrain
psi = 0.001/tGrain
Lstart = 20
Mstart = 20
tMax=100
n=1

L1hist = numeric(tMax)
L2hist = numeric(tMax)
L3hist = numeric(tMax)
L4hist = numeric(tMax)
Mhist = numeric(tMax)
LtotHist = numeric(tMax)

Mhist[1] = Mstart
L1hist[1] = Lstart/4
L2hist[1] = Lstart/4
L3hist[1] = Lstart/4
L4hist[1] = Lstart/4
LtotHist[1] = Lstart

tVec = seq(from=2,to=tMax+1,by=1/tGrain)
for(i in 2:length(tVec)){
  L1 = L1hist[i-1]
  L2 = L2hist[i-1]
  L3 = L3hist[i-1]
  L4 = L4hist[i-1]
  M = Mhist[i-1]

  Ltot = sum(L1,L2,L3,L4)

  dL1 = f*v*M - (alpha*n)*L1 - gamma*L1 - (psi*Ltot)*L1
  dL2 = (alpha*n)*L1 - (alpha*n)*L2 - gamma*L2 - (psi*Ltot)*L2
  dL3 = (alpha*n)*L2 - (alpha*n)*L3 - gamma*L3 - (psi*Ltot)*L3
  dL4 = (alpha*n)*L3 - (alpha*n)*L4 - gamma*L4 - (psi*Ltot)*L4
  dM = (alpha*n)*L4 - g*M

  L1hist[i] = L1 + dL1
  L2hist[i] = L2 + dL2
  L3hist[i] = L3 + dL3
  L4hist[i] = L4 + dL4
  Mhist[i] = M + dM
  LtotHist[i] = sum(L1hist[i],L2hist[i],L3hist[i],L4hist[i])
}

# par(mfrow=c(1,2))
maxY = max(max(L1hist),max(L2hist),max(L3hist),max(L4hist),max(Mhist),max(LtotHist))
plot(L1hist,type="l",col="purple",lty=1,ylim=c(0,maxY),ylab="Counts")
lines(L2hist,col="purple",lty=2)
lines(L3hist,col="purple",lty=3)
lines(L4hist,col="purple",lty=4)
lines(LtotHist,col="darkgreen")
lines(Mhist,col="red")
grid()


# rm(EL4P_cpp);gc()
# EL4P_cpp = MASHcpp::ELP(alpha_new = alpha,gamma_new = gamma,psi_new = psi,tGrain_new = tGrain)
# out = EL4P_cpp$ecologicalSimulation2(g_init = g,f_init = f,v_init = v,L_init = Lstart,M_init = Mstart,tMax = tMax)
# 
# lTotHist = Reduce(f = "+",x = out[1:4])
# maxY = max(vapply(X = c(out,lTotHist),FUN = max,FUN.VALUE = numeric(1)))
# plot(out$L1,type = "l",col="purple",lty=1,ylim=c(0,maxY),ylab = "Counts")
# lines(out$L2,col="purple",lty=2)
# lines(out$L3,col="purple",lty=3)
# lines(out$L4,col="purple",lty=4)
# lines(lTotHist,col="darkgreen")
# lines(out$M,col="red")
# grid()
# par(mfrow=c(1,1))

# ELP_roots <- function(x,par){
#   c(
#     F1 = par$f*par$v*x[2] - (par$alpha+par$gamma+par$psi*x[1])*x[1],
#     F2 = par$alpha*x[1] - par$g*x[2]
#   )
# }
# par = list(f=0.3,v=20,alpha=0.1,gamma=0.1,psi=0.01,g=1/10)
# rootSolve::multiroot(f = ELP_roots,start = c(500,500),parms = par,useFortran = TRUE,positive = TRUE)
#
#
# EL4P_roots <- function(x,par){
#   c(
#     F1 = par$f*par$v*x[5] - (4*par$alpha+par$gamma+par$psi*sum(x[1],x[2],x[3],x[4]))*x[1],
#     F2 = 4*par$alpha*x[1] - (4*par$alpha+par$gamma+par$psi*sum(x[1],x[2],x[3],x[4]))*x[2],
#     F3 = 4*par$alpha*x[2] - (4*par$alpha+par$gamma+par$psi*sum(x[1],x[2],x[3],x[4]))*x[3],
#     F4 = 4*par$alpha*x[3] - (4*par$alpha+par$gamma+par$psi*sum(x[1],x[2],x[3],x[4]))*x[4],
#     F5 = 4*par$alpha*x[4] - par$g*x[5]
#   )
# }
# par = list(f=0.3,v=20,alpha=0.1,gamma=0.1,psi=0.01,g=1/10)
# out = rootSolve::multiroot(f = EL4P_roots,start = c(100,100,100,100,100),parms = par,useFortran = TRUE,positive = TRUE)
# sum(out$root[1:4])
