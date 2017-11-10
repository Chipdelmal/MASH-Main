/*
 * ################################################################################
 *
 *        ____
 *       /  _/___ ___  ____ ___  __  ______  ___
 *       / // __ `__ \/ __ `__ \/ / / / __ \/ _ \
 *     _/ // / / / / / / / / / / /_/ / / / /  __/
 *    /___/_/ /_/ /_/_/ /_/ /_/\__,_/_/ /_/\___/
 *
 *    Immune Class Definition
 *    MASH Team
 *    October 2017
 *
 * ################################################################################
*/

#ifndef IMMUNE_HPP
#define IMMUNE_HPP

#include <stdio.h>
#include <iostream>
#include <string>

#include <RcppGSL.h>

#include "DEBUG.hpp"

// forward declarations
class human;            // forward declare human

// typedefs
typedef std::shared_ptr<human> human_ptr;

// abstract base class for immune system models
class immune_base {
  // give human class full access to immune_base and inheriting classes
  friend class                              human;

public:
  immune_base(const std::string &_immune_model);
  virtual ~immune_base();
  
  // factory method
  static immune_base*                       make_immune(std::string model);

  std::string                               get_immune_model();
  human_ptr                                 get_my_human();

  void                                      set_infected(const bool &i);
  bool                                      get_infected();

protected:

  std::string                               immune_model;
  human_ptr                                 my_human;
  bool                                      infected;

};

class immune_PfSI : public immune_base {
public:
  immune_PfSI(const std::string &_immune_model = "PfSI", const bool &_infected = false);
  ~immune_PfSI();

private:
  
};


#endif /* IMMUNE_HPP */