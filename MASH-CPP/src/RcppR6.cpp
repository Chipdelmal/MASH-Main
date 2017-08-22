// Generated by RcppR6 (0.2.4): do not edit by hand
#include <MASHcpp.h>

// [[Rcpp::export]]
MASHcpp::HumanEventQ HumanEventQ__ctor(int initQ) {
  return MASHcpp::HumanEventQ(initQ);
}
// [[Rcpp::export]]
Rcpp::List HumanEventQ__firstEvent(MASHcpp::RcppR6::RcppR6<MASHcpp::HumanEventQ> obj_) {
  return obj_->firstEvent();
}
// [[Rcpp::export]]
int HumanEventQ__firstTime(MASHcpp::RcppR6::RcppR6<MASHcpp::HumanEventQ> obj_) {
  return obj_->firstTime();
}
// [[Rcpp::export]]
void HumanEventQ__rmFirstEventFromQ(MASHcpp::RcppR6::RcppR6<MASHcpp::HumanEventQ> obj_) {
  obj_->rmFirstEventFromQ();
}
// [[Rcpp::export]]
void HumanEventQ__rmTagFromQ(MASHcpp::RcppR6::RcppR6<MASHcpp::HumanEventQ> obj_, std::string tag) {
  obj_->rmTagFromQ(tag);
}
// [[Rcpp::export]]
int HumanEventQ__get_queueN(MASHcpp::RcppR6::RcppR6<MASHcpp::HumanEventQ> obj_) {
  return obj_->get_queueN();
}
// [[Rcpp::export]]
void HumanEventQ__addEvent2Q(MASHcpp::RcppR6::RcppR6<MASHcpp::HumanEventQ> obj_, Rcpp::List event) {
  obj_->addEvent2Q(event);
}
// [[Rcpp::export]]
Rcpp::List HumanEventQ__get_EventQ(MASHcpp::RcppR6::RcppR6<MASHcpp::HumanEventQ> obj_) {
  return obj_->get_EventQ();
}

// [[Rcpp::export]]
MASHcpp::HistoryGeneric HistoryGeneric__ctor(int N) {
  return MASHcpp::HistoryGeneric(N);
}
// [[Rcpp::export]]
void HistoryGeneric__track_history(MASHcpp::RcppR6::RcppR6<MASHcpp::HistoryGeneric> obj_, double tEvent, std::string event) {
  obj_->track_history(tEvent, event);
}
// [[Rcpp::export]]
Rcpp::List HistoryGeneric__get_history(MASHcpp::RcppR6::RcppR6<MASHcpp::HistoryGeneric> obj_) {
  return obj_->get_history();
}

// [[Rcpp::export]]
MASHcpp::HistoryTravel HistoryTravel__ctor(int N) {
  return MASHcpp::HistoryTravel(N);
}
// [[Rcpp::export]]
void HistoryTravel__track_travel(MASHcpp::RcppR6::RcppR6<MASHcpp::HistoryTravel> obj_, double tTravel, int locationH) {
  obj_->track_travel(tTravel, locationH);
}
// [[Rcpp::export]]
Rcpp::List HistoryTravel__get_travelHistory(MASHcpp::RcppR6::RcppR6<MASHcpp::HistoryTravel> obj_) {
  return obj_->get_travelHistory();
}

// [[Rcpp::export]]
MASHcpp::humanPfSI humanPfSI__ctor(int PfID_init, double tInf_init, double b_init, double c_init, int damID_init, int sireID_init, bool infected_init, bool chemoprophylaxis_init) {
  return MASHcpp::humanPfSI(PfID_init, tInf_init, b_init, c_init, damID_init, sireID_init, infected_init, chemoprophylaxis_init);
}
// [[Rcpp::export]]
std::vector<int> humanPfSI__get_PfID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_) {
  return obj_->get_PfID();
}
// [[Rcpp::export]]
void humanPfSI__push_PfID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_, int PfID_new) {
  obj_->push_PfID(PfID_new);
}
// [[Rcpp::export]]
int humanPfSI__back_PfID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_) {
  return obj_->back_PfID();
}
// [[Rcpp::export]]
std::vector<double> humanPfSI__get_tInf(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_) {
  return obj_->get_tInf();
}
// [[Rcpp::export]]
void humanPfSI__push_tInf(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_, double tInf_new) {
  obj_->push_tInf(tInf_new);
}
// [[Rcpp::export]]
double humanPfSI__get_b(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_) {
  return obj_->get_b();
}
// [[Rcpp::export]]
void humanPfSI__set_b(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_, double b_new) {
  obj_->set_b(b_new);
}
// [[Rcpp::export]]
double humanPfSI__get_c(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_) {
  return obj_->get_c();
}
// [[Rcpp::export]]
void humanPfSI__set_c(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_, double c_new) {
  obj_->set_c(c_new);
}
// [[Rcpp::export]]
std::vector<int> humanPfSI__get_damID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_) {
  return obj_->get_damID();
}
// [[Rcpp::export]]
void humanPfSI__push_damID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_, int damID_new) {
  obj_->push_damID(damID_new);
}
// [[Rcpp::export]]
std::vector<int> humanPfSI__get_sireID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_) {
  return obj_->get_sireID();
}
// [[Rcpp::export]]
void humanPfSI__push_sireID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_, int sireID_new) {
  obj_->push_sireID(sireID_new);
}
// [[Rcpp::export]]
bool humanPfSI__get_infected(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_) {
  return obj_->get_infected();
}
// [[Rcpp::export]]
void humanPfSI__set_infected(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_, bool infected_new) {
  obj_->set_infected(infected_new);
}
// [[Rcpp::export]]
bool humanPfSI__get_chemoprophylaxis(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_) {
  return obj_->get_chemoprophylaxis();
}
// [[Rcpp::export]]
void humanPfSI__set_chemoprophylaxis(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_, bool chemoprophylaxis_new) {
  obj_->set_chemoprophylaxis(chemoprophylaxis_new);
}
// [[Rcpp::export]]
void humanPfSI__track_history(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_, double tEvent, std::string event) {
  obj_->track_history(tEvent, event);
}
// [[Rcpp::export]]
Rcpp::List humanPfSI__get_history(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfSI> obj_) {
  return obj_->get_history();
}

// [[Rcpp::export]]
MASHcpp::mosquitoPfSI mosquitoPfSI__ctor(int PfID_init, double tInf_init, int damID_init, int sireID_init, bool infected_init) {
  return MASHcpp::mosquitoPfSI(PfID_init, tInf_init, damID_init, sireID_init, infected_init);
}
// [[Rcpp::export]]
int mosquitoPfSI__get_PfID(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfSI> obj_) {
  return obj_->get_PfID();
}
// [[Rcpp::export]]
void mosquitoPfSI__set_PfID(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfSI> obj_, int PfID_new) {
  obj_->set_PfID(PfID_new);
}
// [[Rcpp::export]]
double mosquitoPfSI__get_tInf(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfSI> obj_) {
  return obj_->get_tInf();
}
// [[Rcpp::export]]
void mosquitoPfSI__set_tInf(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfSI> obj_, double tInf_new) {
  obj_->set_tInf(tInf_new);
}
// [[Rcpp::export]]
int mosquitoPfSI__get_damID(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfSI> obj_) {
  return obj_->get_damID();
}
// [[Rcpp::export]]
void mosquitoPfSI__set_damID(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfSI> obj_, int damID_new) {
  obj_->set_damID(damID_new);
}
// [[Rcpp::export]]
int mosquitoPfSI__get_sireID(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfSI> obj_) {
  return obj_->get_sireID();
}
// [[Rcpp::export]]
void mosquitoPfSI__set_sireID(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfSI> obj_, int sireID_new) {
  obj_->set_sireID(sireID_new);
}
// [[Rcpp::export]]
bool mosquitoPfSI__get_infected(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfSI> obj_) {
  return obj_->get_infected();
}
// [[Rcpp::export]]
void mosquitoPfSI__set_infected(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfSI> obj_, bool infected_new) {
  obj_->set_infected(infected_new);
}

// [[Rcpp::export]]
MASHcpp::humanPfMOI humanPfMOI__ctor(int PfID_init, double tInf_init, int MOI_init, double b_init, double c_init, int damID_init, int sireID_init, bool chemoprophylaxis_init) {
  return MASHcpp::humanPfMOI(PfID_init, tInf_init, MOI_init, b_init, c_init, damID_init, sireID_init, chemoprophylaxis_init);
}
// [[Rcpp::export]]
std::vector<int> humanPfMOI__get_PfID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_) {
  return obj_->get_PfID();
}
// [[Rcpp::export]]
void humanPfMOI__push_PfID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_, int PfID_new) {
  obj_->push_PfID(PfID_new);
}
// [[Rcpp::export]]
std::vector<double> humanPfMOI__get_tInf(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_) {
  return obj_->get_tInf();
}
// [[Rcpp::export]]
void humanPfMOI__push_tInf(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_, double tInf_new) {
  obj_->push_tInf(tInf_new);
}
// [[Rcpp::export]]
int humanPfMOI__get_MOI(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_) {
  return obj_->get_MOI();
}
// [[Rcpp::export]]
void humanPfMOI__set_MOI(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_, int MOI_new) {
  obj_->set_MOI(MOI_new);
}
// [[Rcpp::export]]
double humanPfMOI__get_b(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_) {
  return obj_->get_b();
}
// [[Rcpp::export]]
void humanPfMOI__set_b(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_, double b_new) {
  obj_->set_b(b_new);
}
// [[Rcpp::export]]
double humanPfMOI__get_c(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_) {
  return obj_->get_c();
}
// [[Rcpp::export]]
void humanPfMOI__set_c(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_, double c_new) {
  obj_->set_c(c_new);
}
// [[Rcpp::export]]
std::vector<int> humanPfMOI__get_damID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_) {
  return obj_->get_damID();
}
// [[Rcpp::export]]
void humanPfMOI__push_damID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_, int damID_new) {
  obj_->push_damID(damID_new);
}
// [[Rcpp::export]]
std::vector<int> humanPfMOI__get_sireID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_) {
  return obj_->get_sireID();
}
// [[Rcpp::export]]
void humanPfMOI__push_sireID(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_, int sireID_new) {
  obj_->push_sireID(sireID_new);
}
// [[Rcpp::export]]
bool humanPfMOI__get_chemoprophylaxis(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_) {
  return obj_->get_chemoprophylaxis();
}
// [[Rcpp::export]]
void humanPfMOI__set_chemoprophylaxis(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_, bool chemoprophylaxis_new) {
  obj_->set_chemoprophylaxis(chemoprophylaxis_new);
}
// [[Rcpp::export]]
void humanPfMOI__add_Infection(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_, int PfID_new, int damID_new, int sireID_new) {
  obj_->add_Infection(PfID_new, damID_new, sireID_new);
}
// [[Rcpp::export]]
void humanPfMOI__clear_Infection(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_, int PfID_ix) {
  obj_->clear_Infection(PfID_ix);
}
// [[Rcpp::export]]
Rcpp::List humanPfMOI__get_Infection(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_) {
  return obj_->get_Infection();
}
// [[Rcpp::export]]
void humanPfMOI__track_history(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_, double tEvent, std::string event) {
  obj_->track_history(tEvent, event);
}
// [[Rcpp::export]]
Rcpp::List humanPfMOI__get_history(MASHcpp::RcppR6::RcppR6<MASHcpp::humanPfMOI> obj_) {
  return obj_->get_history();
}

// [[Rcpp::export]]
MASHcpp::mosquitoPfMOI mosquitoPfMOI__ctor(int PfID_init, double tInf_init, int MOI_init, int damID_init, int sireID_init) {
  return MASHcpp::mosquitoPfMOI(PfID_init, tInf_init, MOI_init, damID_init, sireID_init);
}
// [[Rcpp::export]]
std::vector<int> mosquitoPfMOI__get_PfID(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_) {
  return obj_->get_PfID();
}
// [[Rcpp::export]]
void mosquitoPfMOI__push_PfID(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_, int PfID_new) {
  obj_->push_PfID(PfID_new);
}
// [[Rcpp::export]]
std::vector<double> mosquitoPfMOI__get_tInf(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_) {
  return obj_->get_tInf();
}
// [[Rcpp::export]]
void mosquitoPfMOI__push_tInf(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_, double tInf_new) {
  obj_->push_tInf(tInf_new);
}
// [[Rcpp::export]]
int mosquitoPfMOI__get_MOI(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_) {
  return obj_->get_MOI();
}
// [[Rcpp::export]]
void mosquitoPfMOI__set_MOI(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_, int MOI_new) {
  obj_->set_MOI(MOI_new);
}
// [[Rcpp::export]]
std::vector<int> mosquitoPfMOI__get_damID(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_) {
  return obj_->get_damID();
}
// [[Rcpp::export]]
void mosquitoPfMOI__push_damID(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_, int damID_new) {
  obj_->push_damID(damID_new);
}
// [[Rcpp::export]]
std::vector<int> mosquitoPfMOI__get_sireID(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_) {
  return obj_->get_sireID();
}
// [[Rcpp::export]]
void mosquitoPfMOI__push_sireID(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_, int sireID_new) {
  obj_->push_sireID(sireID_new);
}
// [[Rcpp::export]]
void mosquitoPfMOI__add_Infection(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_, int PfID_new, double tInf_new, int damID_new, int sireID_new) {
  obj_->add_Infection(PfID_new, tInf_new, damID_new, sireID_new);
}
// [[Rcpp::export]]
Rcpp::List mosquitoPfMOI__get_Infection(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_, int PfID_ix) {
  return obj_->get_Infection(PfID_ix);
}
// [[Rcpp::export]]
Rcpp::List mosquitoPfMOI__get_InfectionIx(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_, int ix) {
  return obj_->get_InfectionIx(ix);
}
// [[Rcpp::export]]
Rcpp::List mosquitoPfMOI__get_InfectionEIP(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_, double incubation) {
  return obj_->get_InfectionEIP(incubation);
}
// [[Rcpp::export]]
std::vector<int> mosquitoPfMOI__which_EIP(MASHcpp::RcppR6::RcppR6<MASHcpp::mosquitoPfMOI> obj_, double incubation) {
  return obj_->which_EIP(incubation);
}

// [[Rcpp::export]]
MASHcpp::RiskQ RiskQ__ctor() {
  return MASHcpp::RiskQ();
}
// [[Rcpp::export]]
int RiskQ__get_N(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_) {
  return obj_->get_N();
}
// [[Rcpp::export]]
void RiskQ__set_N(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_, int N_new) {
  obj_->set_N(N_new);
}
// [[Rcpp::export]]
std::vector<int> RiskQ__get_who(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_) {
  return obj_->get_who();
}
// [[Rcpp::export]]
void RiskQ__push_who(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_, int who_new) {
  obj_->push_who(who_new);
}
// [[Rcpp::export]]
std::vector<double> RiskQ__get_pTm(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_) {
  return obj_->get_pTm();
}
// [[Rcpp::export]]
void RiskQ__push_pTm(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_, double pTm_new) {
  obj_->push_pTm(pTm_new);
}
// [[Rcpp::export]]
std::vector<double> RiskQ__get_w(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_) {
  return obj_->get_w();
}
// [[Rcpp::export]]
void RiskQ__push_w(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_, double w_new) {
  obj_->push_w(w_new);
}
// [[Rcpp::export]]
void RiskQ__add_HumanHost(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_, int who_new, double pTm_new, double w_new) {
  obj_->add_HumanHost(who_new, pTm_new, w_new);
}
// [[Rcpp::export]]
Rcpp::List RiskQ__get_HumanHost(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_) {
  return obj_->get_HumanHost();
}
// [[Rcpp::export]]
Rcpp::List RiskQ__get_HumanHostIx(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_, int ix) {
  return obj_->get_HumanHostIx(ix);
}
// [[Rcpp::export]]
void RiskQ__clear_HumanHost(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_) {
  obj_->clear_HumanHost();
}
// [[Rcpp::export]]
int RiskQ__get_nOther(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_) {
  return obj_->get_nOther();
}
// [[Rcpp::export]]
void RiskQ__set_nOther(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_, int nOther_new) {
  obj_->set_nOther(nOther_new);
}
// [[Rcpp::export]]
void RiskQ__add_OtherHost(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_, double otherW_new, int typeID_new) {
  obj_->add_OtherHost(otherW_new, typeID_new);
}
// [[Rcpp::export]]
Rcpp::List RiskQ__get_OtherHost(MASHcpp::RcppR6::RcppR6<MASHcpp::RiskQ> obj_) {
  return obj_->get_OtherHost();
}

// [[Rcpp::export]]
MASHcpp::ImagoQ ImagoQ__ctor() {
  return MASHcpp::ImagoQ();
}
// [[Rcpp::export]]
void ImagoQ__clear_ImagoQ(MASHcpp::RcppR6::RcppR6<MASHcpp::ImagoQ> obj_) {
  obj_->clear_ImagoQ();
}
// [[Rcpp::export]]
void ImagoQ__clear_ImagoQTime(MASHcpp::RcppR6::RcppR6<MASHcpp::ImagoQ> obj_, double time) {
  obj_->clear_ImagoQTime(time);
}
// [[Rcpp::export]]
void ImagoQ__add_ImagoQ(MASHcpp::RcppR6::RcppR6<MASHcpp::ImagoQ> obj_, int N_new, double tEmerge_new, int genotype_new, std::string damID_new, std::string sireID_new) {
  obj_->add_ImagoQ(N_new, tEmerge_new, genotype_new, damID_new, sireID_new);
}
// [[Rcpp::export]]
double ImagoQ__track_ImagoQ(MASHcpp::RcppR6::RcppR6<MASHcpp::ImagoQ> obj_, double time) {
  return obj_->track_ImagoQ(time);
}
// [[Rcpp::export]]
int ImagoQ__get_N(MASHcpp::RcppR6::RcppR6<MASHcpp::ImagoQ> obj_) {
  return obj_->get_N();
}
// [[Rcpp::export]]
void ImagoQ__set_N(MASHcpp::RcppR6::RcppR6<MASHcpp::ImagoQ> obj_, int N_new) {
  obj_->set_N(N_new);
}
// [[Rcpp::export]]
Rcpp::List ImagoQ__get_ImagoQ(MASHcpp::RcppR6::RcppR6<MASHcpp::ImagoQ> obj_) {
  return obj_->get_ImagoQ();
}
// [[Rcpp::export]]
Rcpp::List ImagoQ__get_ImagoQTime(MASHcpp::RcppR6::RcppR6<MASHcpp::ImagoQ> obj_, double tNow, bool clear) {
  return obj_->get_ImagoQTime(tNow, clear);
}

// [[Rcpp::export]]
MASHcpp::EggQ EggQ__ctor() {
  return MASHcpp::EggQ();
}
// [[Rcpp::export]]
void EggQ__clear_EggQ(MASHcpp::RcppR6::RcppR6<MASHcpp::EggQ> obj_) {
  obj_->clear_EggQ();
}
// [[Rcpp::export]]
void EggQ__clear_EggQTime(MASHcpp::RcppR6::RcppR6<MASHcpp::EggQ> obj_, double time) {
  obj_->clear_EggQTime(time);
}
// [[Rcpp::export]]
void EggQ__add_EggQ(MASHcpp::RcppR6::RcppR6<MASHcpp::EggQ> obj_, int N_new, double tOviposit_new, int genotype_new, std::string damID_new, std::string sireID_new) {
  obj_->add_EggQ(N_new, tOviposit_new, genotype_new, damID_new, sireID_new);
}
// [[Rcpp::export]]
double EggQ__track_EggQ(MASHcpp::RcppR6::RcppR6<MASHcpp::EggQ> obj_, double time) {
  return obj_->track_EggQ(time);
}
// [[Rcpp::export]]
int EggQ__get_N(MASHcpp::RcppR6::RcppR6<MASHcpp::EggQ> obj_) {
  return obj_->get_N();
}
// [[Rcpp::export]]
void EggQ__set_N(MASHcpp::RcppR6::RcppR6<MASHcpp::EggQ> obj_, int N_new) {
  obj_->set_N(N_new);
}
// [[Rcpp::export]]
Rcpp::List EggQ__get_EggQ(MASHcpp::RcppR6::RcppR6<MASHcpp::EggQ> obj_) {
  return obj_->get_EggQ();
}
// [[Rcpp::export]]
Rcpp::List EggQ__get_EggQTime(MASHcpp::RcppR6::RcppR6<MASHcpp::EggQ> obj_, double tNow, bool clear) {
  return obj_->get_EggQTime(tNow, clear);
}

// [[Rcpp::export]]
MASHcpp::EL4P EL4P__ctor(int numGenotypes, double psi_new, double alpha_new, double p_new) {
  return MASHcpp::EL4P(numGenotypes, psi_new, alpha_new, p_new);
}
// [[Rcpp::export]]
void EL4P__oneStep(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_) {
  obj_->oneStep();
}
// [[Rcpp::export]]
void EL4P__oneStep_GEL4P(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_, double M, double eqAqua, double G, double lifespan) {
  obj_->oneStep_GEL4P(M, eqAqua, G, lifespan);
}
// [[Rcpp::export]]
void EL4P__burnIn_GEL4P(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_, double M, double eqAqua, double G, double lifespan, int tMax) {
  obj_->burnIn_GEL4P(M, eqAqua, G, lifespan, tMax);
}
// [[Rcpp::export]]
void EL4P__G2K_GEL4P(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_, double eqAqua, double G, double lifespan, int tMax) {
  obj_->G2K_GEL4P(eqAqua, G, lifespan, tMax);
}
// [[Rcpp::export]]
std::vector<double> EL4P__checkDX_GEL4P(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_, double eqAqua, double G, double lifespan, int tMax) {
  return obj_->checkDX_GEL4P(eqAqua, G, lifespan, tMax);
}
// [[Rcpp::export]]
void EL4P__addEggs(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_, double eggs_N, int genotype) {
  obj_->addEggs(eggs_N, genotype);
}
// [[Rcpp::export]]
Rcpp::List EL4P__get_allGenotypes(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_) {
  return obj_->get_allGenotypes();
}
// [[Rcpp::export]]
Rcpp::List EL4P__get_genotypeIx(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_, int ix) {
  return obj_->get_genotypeIx(ix);
}
// [[Rcpp::export]]
double EL4P__get_psi(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_) {
  return obj_->get_psi();
}
// [[Rcpp::export]]
void EL4P__set_psi(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_, double psi_new) {
  obj_->set_psi(psi_new);
}
// [[Rcpp::export]]
double EL4P__get_alpha(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_) {
  return obj_->get_alpha();
}
// [[Rcpp::export]]
void EL4P__set_alpha(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_, double alpha_new) {
  obj_->set_alpha(alpha_new);
}
// [[Rcpp::export]]
double EL4P__get_p(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_) {
  return obj_->get_p();
}
// [[Rcpp::export]]
void EL4P__set_p(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_, double p_new) {
  obj_->set_p(p_new);
}
// [[Rcpp::export]]
int EL4P__get_numGenotypes(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_) {
  return obj_->get_numGenotypes();
}
// [[Rcpp::export]]
double EL4P__get_totalLambda(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_) {
  return obj_->get_totalLambda();
}
// [[Rcpp::export]]
double EL4P__get_specificLambda(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_, int ix) {
  return obj_->get_specificLambda(ix);
}
// [[Rcpp::export]]
void EL4P__reset(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_) {
  obj_->reset();
}
// [[Rcpp::export]]
void EL4P__set_pop(MASHcpp::RcppR6::RcppR6<MASHcpp::EL4P> obj_, Rcpp::List initPop) {
  obj_->set_pop(initPop);
}

// [[Rcpp::export]]
MASHcpp::ELPool ELPool__ctor(double alpha_new, double gamma_new, double psi_new, double sigma_new) {
  return MASHcpp::ELPool(alpha_new, gamma_new, psi_new, sigma_new);
}
// [[Rcpp::export]]
void ELPool__oneStep(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_) {
  obj_->oneStep();
}
// [[Rcpp::export]]
double ELPool__get_psi(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_) {
  return obj_->get_psi();
}
// [[Rcpp::export]]
void ELPool__set_psi(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_, double psi_new) {
  obj_->set_psi(psi_new);
}
// [[Rcpp::export]]
double ELPool__get_alpha(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_) {
  return obj_->get_alpha();
}
// [[Rcpp::export]]
void ELPool__set_alpha(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_, double alpha_new) {
  obj_->set_alpha(alpha_new);
}
// [[Rcpp::export]]
double ELPool__get_gamma(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_) {
  return obj_->get_gamma();
}
// [[Rcpp::export]]
void ELPool__set_gamma(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_, double gamma_new) {
  obj_->set_gamma(gamma_new);
}
// [[Rcpp::export]]
double ELPool__get_sigma(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_) {
  return obj_->get_sigma();
}
// [[Rcpp::export]]
void ELPool__set_sigma(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_, double sigma_new) {
  obj_->set_sigma(sigma_new);
}
// [[Rcpp::export]]
double ELPool__get_L(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_) {
  return obj_->get_L();
}
// [[Rcpp::export]]
void ELPool__set_L(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_, double L_new) {
  obj_->set_L(L_new);
}
// [[Rcpp::export]]
double ELPool__get_E(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_) {
  return obj_->get_E();
}
// [[Rcpp::export]]
void ELPool__set_E(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_, double E_new) {
  obj_->set_E(E_new);
}
// [[Rcpp::export]]
Rcpp::List ELPool__get_ELPool(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_) {
  return obj_->get_ELPool();
}
// [[Rcpp::export]]
void ELPool__set_ELPool(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_, double E_new, double L_new) {
  obj_->set_ELPool(E_new, L_new);
}
// [[Rcpp::export]]
Rcpp::List ELPool__get_parameters(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_) {
  return obj_->get_parameters();
}
// [[Rcpp::export]]
void ELPool__set_parameters(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_, double alpha_new, double gamma_new, double psi_new, double sigma_new) {
  obj_->set_parameters(alpha_new, gamma_new, psi_new, sigma_new);
}
// [[Rcpp::export]]
void ELPool__reset(MASHcpp::RcppR6::RcppR6<MASHcpp::ELPool> obj_) {
  obj_->reset();
}

// [[Rcpp::export]]
MASHcpp::MosquitoFemaleHistory MosquitoFemaleHistory__ctor() {
  return MASHcpp::MosquitoFemaleHistory();
}
// [[Rcpp::export]]
void MosquitoFemaleHistory__historyInit(MASHcpp::RcppR6::RcppR6<MASHcpp::MosquitoFemaleHistory> obj_, Rcpp::Environment privateEnv) {
  obj_->historyInit(privateEnv);
}
// [[Rcpp::export]]
void MosquitoFemaleHistory__historyTrack(MASHcpp::RcppR6::RcppR6<MASHcpp::MosquitoFemaleHistory> obj_, Rcpp::Environment privateEnv, bool alive) {
  obj_->historyTrack(privateEnv, alive);
}
// [[Rcpp::export]]
void MosquitoFemaleHistory__historyFeed(MASHcpp::RcppR6::RcppR6<MASHcpp::MosquitoFemaleHistory> obj_, Rcpp::Environment privateEnv) {
  obj_->historyFeed(privateEnv);
}
// [[Rcpp::export]]
void MosquitoFemaleHistory__calcBionomics(MASHcpp::RcppR6::RcppR6<MASHcpp::MosquitoFemaleHistory> obj_) {
  obj_->calcBionomics();
}
// [[Rcpp::export]]
Rcpp::List MosquitoFemaleHistory__exportHistory(MASHcpp::RcppR6::RcppR6<MASHcpp::MosquitoFemaleHistory> obj_) {
  return obj_->exportHistory();
}


