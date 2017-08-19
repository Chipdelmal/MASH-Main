///////////////////////////////////////////////////////////////////////////////
//       __  __           __    __  ___
//      / / / /___ ______/ /_  /  |/  /___ _____
//     / /_/ / __ `/ ___/ __ \/ /|_/ / __ `/ __ \
//    / __  / /_/ (__  ) / / / /  / / /_/ / /_/ /
//   /_/ /_/\__,_/____/_/ /_/_/  /_/\__,_/ .___/
//                                      /_/
//
//   MASH-CPP
//   HashMap C Helper Functions
//   Sean Wu
//   August 18, 2017
//
///////////////////////////////////////////////////////////////////////////////

// include headers
// #include <Rcpp.h>
// #include "Utility.h"
// using namespace Rcpp;

// SEXP do_eapply(SEXP call, SEXP op, SEXP args, SEXP rho)
// {
//     SEXP env, ans, R_fcall, FUN, tmp, tmp2, ind;
//     int i, k, k2;
//     int /* boolean */ all, useNms;
//
//     checkArity(op, args);
//
//     PROTECT(env = eval(CAR(args), rho));
//     if (ISNULL(env))
// 	error(_("use of NULL environment is defunct"));
//     if( !isEnvironment(env) )
// 	error(_("argument must be an environment"));
//
//     FUN = CADR(args);
//     if (!isSymbol(FUN))
// 	error(_("arguments must be symbolic"));
//
//     /* 'all.names' : */
//     all = asLogical(eval(CADDR(args), rho));
//     if (all == NA_LOGICAL) all = 0;
//
//     /* 'USE.NAMES' : */
//     useNms = asLogical(eval(CADDDR(args), rho));
//     if (useNms == NA_LOGICAL) useNms = 0;
//
//     if (env == R_BaseEnv || env == R_BaseNamespace)
// 	k = BuiltinSize(all, 0);
//     else if (HASHTAB(env) != R_NilValue)
// 	k = HashTableSize(HASHTAB(env), all);
//     else
// 	k = FrameSize(FRAME(env), all);
//
//     PROTECT(ans  = allocVector(VECSXP, k));
//     PROTECT(tmp2 = allocVector(VECSXP, k));
//
//     k2 = 0;
//     if (env == R_BaseEnv || env == R_BaseNamespace)
// 	BuiltinValues(all, 0, tmp2, &k2);
//     else if (HASHTAB(env) != R_NilValue)
// 	HashTableValues(HASHTAB(env), all, tmp2, &k2);
//     else
// 	FrameValues(FRAME(env), all, tmp2, &k2);
//
//     SEXP Xsym = install("X");
//     SEXP isym = install("i");
//     PROTECT(ind = allocVector(INTSXP, 1));
//     /* tmp :=  `[`(<elist>, i) */
//     PROTECT(tmp = LCONS(R_Bracket2Symbol,
// 			LCONS(Xsym, LCONS(isym, R_NilValue))));
//     /* fcall :=  <FUN>( tmp, ... ) */
//     PROTECT(R_fcall = LCONS(FUN, LCONS(tmp, LCONS(R_DotsSymbol, R_NilValue))));
//
//     defineVar(Xsym, tmp2, rho);
//     SET_NAMED(tmp2, 1);
//     defineVar(isym, ind, rho);
//     SET_NAMED(ind, 1);
//
//     for(i = 0; i < k2; i++) {
// 	INTEGER(ind)[0] = i+1;
// 	SEXP tmp = R_forceAndCall(R_fcall, 1, rho);
// 	if (MAYBE_REFERENCED(tmp))
// 	    tmp = lazy_duplicate(tmp);
// 	SET_VECTOR_ELT(ans, i, tmp);
//     }
//
//     if (useNms) {
// 	SEXP names;
// 	PROTECT(names = allocVector(STRSXP, k));
// 	k = 0;
// 	if (env == R_BaseEnv || env == R_BaseNamespace)
// 	    BuiltinNames(all, 0, names, &k);
// 	else if(HASHTAB(env) != R_NilValue)
// 	    HashTableNames(HASHTAB(env), all, names, &k);
// 	else
// 	    FrameNames(FRAME(env), all, names, &k);
//
// 	setAttrib(ans, R_NamesSymbol, names);
// 	UNPROTECT(1);
//     }
//     UNPROTECT(6);
//     return(ans);
// }