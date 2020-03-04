#!/bin/bash
GIT_HASH=$(git rev-parse --short HEAD)
GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
OUTDIR=../../../output/kodi

mv vero3-mediacenter-osmc.deb ${OUTDIR}/vero3-mediacenter-osmc~${GIT_BRANCH}~${GIT_HASH}.deb 2>/dev/null
mv vero3-mediacenter-debug-osmc.deb ${OUTDIR}/vero3-mediacenter-debug-osmc~${GIT_BRANCH}~${GIT_HASH}.deb 2>/dev/null

mv rbp2-mediacenter-osmc.deb ${OUTDIR}/rbp2-mediacenter-osmc~${GIT_BRANCH}~${GIT_HASH}.deb 2>/dev/null
mv rbp2-mediacenter-debug-osmc.deb ${OUTDIR}/rbp2-mediacenter-debug-osmc~${GIT_BRANCH}~${GIT_HASH}.deb 2>/dev/null
