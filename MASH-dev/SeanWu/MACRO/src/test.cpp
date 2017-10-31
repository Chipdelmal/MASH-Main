#include <RcppGSL.h>

#include "human.hpp"

using namespace Rcpp;

void f(int a){
  std::cout << "function f has integer a: " << a << std::endl;
};

//'@export
// [[Rcpp::export]]
void testEventQueue(){
  
  std::vector<event> eventQ; 
  event anEvent = event("hi",100,std::bind(f,5));
  eventQ.push_back(anEvent);
  
  eventQ[0].eventF();
};


//'@export
// [[Rcpp::export]]
void testHuman(){
  human* h = new human(1);
  std::cout << "human 1 id: " << h->get_id() << std::endl;
  h->set_state("state1");
  std::cout << "human 1 state: " << h->get_state() << std::endl;
  h->add2Q_set_stateTest(1.00,"state2");
  h->fireEventTest();
  std::cout << "human 1 state: " << h->get_state() << std::endl;
  
  human* h1 = new human(2);
  std::cout << "human 2 id: " << h1->get_id() << std::endl;
  h1->set_state("state53");
  std::cout << "human 2 state: " << h1->get_state() << std::endl;
  h1->add2Q_set_stateTest(1.00,"state223");
  h1->fireEventTest();
  std::cout << "human 2 state: " << h1->get_state() << std::endl;
  std::cout << "human 1 state: " << h->get_state() << std::endl;
  
  delete h;
  delete h1;
}