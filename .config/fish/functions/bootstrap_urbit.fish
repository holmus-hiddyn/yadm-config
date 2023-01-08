#!/usr/bin/env fish

function bootstrap_urbit -d "Extremely simple utility to ensure Urbit binary present"
    if not type -q urbit
        curl -L https://urbit.org/install/mac/latest -o $XDG_BIN_HOME/urbit | tar xzk --strip=1
    end
end