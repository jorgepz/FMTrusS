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

  assertEqual( true, true );
