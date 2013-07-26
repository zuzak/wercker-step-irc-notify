
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

if [ ! -n "$WERCKER_IRC_NOTIFY_FAILED_MESSAGE" ]; then
  if [ ! -n "$DEPLOY" ]; then
    export WERCKER_IRC_NOTIFY_FAILED_MESSAGE="$WERCKER_APPLICATION_OWNER_NAME/$WERCKER_APPLICATION_NAME: build of $WERCKER_GIT_BRANCH by $WERCKER_STARTED_BY failed."
  else
    export WERCKER_IRC_NOTIFY_FAILED_MESSAGE="$WERCKER_APPLICATION_OWNER_NAME/$WERCKER_APPLICATION_NAME: deploy to $WERCKER_DEPLOYTARGET_NAME by $WERCKER_STARTED_BY failed."
  fi
fi

if [ ! -n "$WERCKER_IRC_NOTIFY_PASSED_MESSAGE" ]; then
  if [ ! -n "$DEPLOY" ]; then
    export WERCKER_IRC_NOTIFY_PASSED_MESSAGE="$WERCKER_APPLICATION_OWNER_NAME/$WERCKER_APPLICATION_NAME: build of $WERCKER_GIT_BRANCH by $WERCKER_STARTED_BY passed."
  else
    export WERCKER_IRC_NOTIFY_PASSED_MESSAGE="$WERCKER_APPLICATION_OWNER_NAME/$WERCKER_APPLICATION_NAME: deploy to $WERCKER_DEPLOYTARGET_NAME by $WERCKER_STARTED_BY passed."
  fi
fi

if [ "$WERCKER_RESULT" = "passed" ]; then
  export WERCKER_IRC_NOTIFY_MESSAGE="$WERCKER_IRC_NOTIFY_PASSED_MESSAGE"
else
  export WERCKER_IRC_NOTIFY_MESSAGE="$WERCKER_IRC_NOTIFY_FAILED_MESSAGE"
fi


if [ "$WERCKER_IRC_NOTIFY_ON" = "failed" ]; then
  if [ "$WERCKER_RESULT" = "passed" ]; then
    echo "Skipping.."
    return 0
  fi
fi



python "$WERCKER_STEP_ROOT/main.py" "$WERCKER_IRC_NOTIFY_SERVER" "$WERCKER_IRC_NOTIFY_PORT" "$WERCKER_IRC_NOTIFY_NICKNAME" "$WERCKER_IRC_NOTIFY_CHANNEL" "$WERCKER_IRC_NOTIFY_MESSAGE"