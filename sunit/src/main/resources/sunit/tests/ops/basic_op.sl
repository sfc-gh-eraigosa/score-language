namespace: sunit.tests.ops

operations:
  - operation_to_test:
      inputs:
        - host
        - port
        - command: "'cmd'"
      action:
        python_script: |
          #some meaningful action
      outputs:
        - message: if error_message not null error_message else "Good"
        - command_result: result
        - status
      results:
        - SUCCESS: int(status) == 1
        - FAILURE

