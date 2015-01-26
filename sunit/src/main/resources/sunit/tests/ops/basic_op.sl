namespace: sunit.tests.ops

operations:
  - operation_to_test:
      inputs:
        - input1
        - input2: input1
        - input3: "'input3'"
      action:
        python_script: |
          action_outputs_1 = "10"
          action_outputs_2 = "20"
      outputs:
        - output_1: action_outputs_1
        - output_2: "'output_2'"
      results:
        - SUCCESS: output_2 == "output_2"
        - CUSTOM: output_2 == "custom_output"

