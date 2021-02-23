SwayIdle
========

# Idle

There are three action timeouts after an inactivity detected by Sway:

- screen lock (10 min by default)
- turning all monitors off (12min by default)
- sleep mode (15min by default)

The timeouts can be set in the `idle.conf` configuration file.

Only positive values are accepted.

We can use different duration value types (ex: `1s`, `2m` and `3h`):

- `s` for second
- `m` for minute
- `h` for hour

# Inhibitors

An inhibitor is a condition that prevents *swayidle* to lock, turn off monitors
or put the computer in sleep mode. For instance, wathching a movie could be
a reason to create a inhibitor that checks on pulseaudio usage.

All inhibitor scripts are located in the `inhibitors/units` directory.
The `inhibitors.sh` script reads the `inhibitors.conf` configuration file
where are listed all inhibitors that we want to use as conditions and
runs the corresponding inhibitor scripts.

List all inhibitors available:

```bash
find inhibitors/units -type f -exec sh -c "basename {} | cut -d'.' -f1" \;
```
