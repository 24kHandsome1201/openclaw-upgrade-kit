# Validation Patterns

Validation after ops changes may include:
- service status check
- fresh log inspection
- config syntax validation
- connectivity check
- endpoint health check
- absence of prior blocking error pattern

## Rollback path

For ops work, validation should be paired with a fast rollback hint whenever runtime or config state changed.

Preferred shape:
- rollback target
- how to restore the last known-good state
- what to recheck after rollback

Examples:
- `gateway config` — restore the previous config backup and restart the service, then recheck status/logs
- `service unit` — revert the changed unit or environment override, reload the manager, then verify active state
- `polling/webhook mode` — return to the prior transport mode, then confirm inbound/outbound health again

If no rollback is required:
- `No rollback action is needed for this step.`
