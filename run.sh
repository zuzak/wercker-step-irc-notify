
if [ ! -n "$WERCKER_IRC_NOTIFY_SERVER" ]; then
  error 'Please specify server property'
  exit 1
fi

if [ ! -n "$WERCKER_IRC_NOTIFY_PORT" ]; then
  error 'Please specify port property'
  exit 1
fi

if [ ! -n "$WERCKER_IRC_NOTIFY_NICKNAME" ]; then
  error 'Please specify nickname property'
  exit 1
fi

if [ ! -n "$WERCKER_IRC_NOTIFY_CHANNEL" ]; then
  error 'Please specify channel property'
  exit 1
fi
if [ ! -n "$WERCKER_IRC_NOTIFY_MESSAGE" ]; then
  error 'Please specify message property'
  exit 1
fi

python "$WERCKER_STEP_ROOT/main.py" "$WERCKER_IRC_NOTIFY_SERVER" "$WERCKER_IRC_NOTIFY_PORT" "$WERCKER_IRC_NOTIFY_NICKNAME" "$WERCKER_IRC_NOTIFY_CHANNEL" "$WERCKER_IRC_NOTIFY_MESSAGE"