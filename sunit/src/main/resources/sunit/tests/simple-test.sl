package: sunit.tests

imports:
  ops: sunit.ops
  validators: sunit.validators

flow:
  name: simple_test
  workflow:
    run_mock:
      do:
        ops.mock_op:
          - op_name: simple_op
      publish:
        - action_inputs
        - action_outputs
        - operation_outputs
        - operation_result

    validate:
      do:
        ops.compute_daylight_time_zone:
          - time_zone_as_string: time_zone
      publish:
        - daylight_time_zone: daylight_time_zone
  results:
    - SUCCESS