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
          - host: "'host_name'"
          - port: 22
      mock:
        action_outputs:
          - status: "'1'"
          - result: "'good result'"
          - error_message: "'Too Bad...'"
      publish:
        - status
        - message
        - command_result

#        - action_inputs
#        - action_outputs
#        - operation_outputs
#        - operation_result: |
#            action_output_1 == "'1'"
#            action_output_2 == "'2'"

    validate_status:
      do:
        validators.equal_validator:
          - param: status
          - value: "'1'"
