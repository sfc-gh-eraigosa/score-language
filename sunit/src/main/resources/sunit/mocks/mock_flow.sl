namespace: sunit.tests.flows

flow:
  name: mock_flow
  inputs:
    - ref_name
    - action_outputs
    - op_inputs
 workflow:
    run_mock:
      mock:
        - ref_name
        - ref_inputs:

  outputs:
    - action_inputs
    - action_outputs
    - operation_outputs
    - operation_result

