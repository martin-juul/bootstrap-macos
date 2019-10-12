#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

cat >> /private/etc/hosts <<EOL
# Spotify Ads
127.0.0.0 media-match.com
127.0.0.0 adclick.g.doublecklick.net
127.0.0.0 www.googleadservices.com
127.0.0.0 open.spotify.com
127.0.0.0 pagead2.googlesyndication.com
127.0.0.0 desktop.spotify.com
127.0.0.0 googleads.g.doubleclick.net
127.0.0.0 pubads.g.doubleclick.net
127.0.0.0 securepubads.g.doubleclick.net
127.0.0.0 audio2.spotify.com
127.0.0.0 www.omaze.com
127.0.0.0 omaze.com
127.0.0.0 bounceexchange.com
127.0.0.0 core.insightexpressai.com
127.0.0.0 content.bitsontherun.com
127.0.0.0 s0.2mdn.net
127.0.0.0 v.jwpcdn.com
127.0.0.0 d2gi7ultltnc2u.cloudfront.net
127.0.0.0 crashdump.spotify.com
127.0.0.0 adeventtracker.spotify.com
127.0.0.0 log.spotify.com
127.0.0.0 analytics.spotify.com
127.0.0.0 ads-fa.spotify.com
EOL
