namespace: sunit.tests

imports:
  ops: sunit.tests.ops
  validators: sunit.validators

flow:
  name: simple_test
  workflow:
    run_mock:
      do:
        ops.basic_op:
          - op_name: simple_op
      publish:
        - action_inputs
        - action_outputs
        - operation_outputs
        - operation_result
