#
# About
# --------------------------------------------------
# This script allow you compile your *.less files into .css file

#
# Requirements
# --------------------------------------------------
# You need install Recess (read more at https://github.com/twitter/recess)

#
# How to use
# --------------------------------------------------
# Run
# $ make                    -- Compile less to css file
# $ make theme-css          -- Compile less to css file
# $ make watch              -- Run folder watching only
# $ make all                -- Compile css file anr run folder watching.
# $ make watch-osx          -- Run folder watching only (extended for OSX). See watch.conf for more infomation
# $ make all-osx            -- Compile css file anr run folder watching (extended for OSX). See watch.conf for more infomation

#
# Defaults
# --------------------------------------------------
THEME_LESS 			= ./less/msmobile.less
THEME_CSS			= ./css/msmobile.css
THEME_CSS_MIN		= ./css/msmobile.min.css

# RESPONSIVE_LESS 		= ./less/responsive/fabrique.responsive.less
# RESPONSIVE_CSS		= ./css/fabrique.responsive.css
# RESPONSIVE_CSS_MIN	= ./css/fabrique.responsive.min.css

DATE 			= $(shell date +%H:%M:%S)
CHECK 			= \033[32m✔\033[39m

#
# Build CSS
# -------------------------

build: theme-css

#
# CSS COMPILE
# -------------------------

theme-css:
	@printf "Compile theme less files..."
	@mkdir -p css
	@recess ${THEME_LESS} --compile > ${THEME_CSS}
	@recess ${THEME_LESS} --compile --compress > ${THEME_CSS_MIN}
#	@recess ${RESPONSIVE_LESS} --compile > ${RESPONSIVE_CSS}
#	@recess ${RESPONSIVE_LESS} --compile --compress > ${RESPONSIVE_CSS_MIN}
	@printf "\rCompile theme less files...             ${CHECK} Done | ${DATE}\n"

#
# WATCH LESS FILES
# -------------------------

watch:
	clear;
	@echo "Watching theme less files..."
	@recess --compile --compress ${THEME_LESS}:${THEME_CSS} --watch THEME_LESS_DIR


#
# WATCH LESS FILES (For OSX)
# See watch.conf for more infomation
# -------------------------

watch-osx:
	clear;
	@echo "Watching theme less files..."
	node watcher.js


#
# CSS COMPILE AND WATCH LESS FILES
# -------------------------

all: theme-css watch

all-osx: theme-css watch-osx
