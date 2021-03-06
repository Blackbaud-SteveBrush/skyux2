# Fail the build if this step fails
set -e

# Necessary to stop pull requests from forks from running outside of Savage
if [ "$TRAVIS_SECURE_ENV_VARS" == "true" ]; then
  # Building SKY UX requires a lot of memory:
  # https://github.com/npm/npm/issues/12238#issuecomment-301645764
  node --max-old-space-size=4096 `which npm` run build:skyux
else
  echo -e "Pull requests from forks are run via Savage."
fi
