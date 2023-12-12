% function for testing FMTS using moxunit
% ----------------------------------------
function test_suite=run_test_problems_moxunit
  % initialize tests
  try
    test_functions=localfunctions()
  catch
  end
  initTestSuite;

function test_1
  Example_1
  assertEqual( verif_boolean, true );

function test_2
  Example_4
  assertEqual( verif_boolean, true );

function test_3
  Example_5
  assertEqual( verif_boolean, true );

  