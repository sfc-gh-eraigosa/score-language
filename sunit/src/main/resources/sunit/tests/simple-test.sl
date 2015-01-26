namespace: sunit.tests

imports:
  ops: sunit.tests.ops
  validators: sunit.validators

flow:
  name: simple_test
  workflow:
    run_mock:
      do:
        ops.operation_to_test:
          - input1: "'foo'"
      mock:
        action_outputs:
          - action_output_1: "'1'"
          - action_output_2: "'2'"
      publish:
        - action_inputs
        - action_outputs
        - operation_outputs
        - operation_result: |
            action_output_1 = "'1'"
            action_output_2 = "'2'"
