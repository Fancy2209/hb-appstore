BINARY      := appstore

APP_TITLE   := HB App Store
APP_AUTHOR  := 4TU Team

SOURCES     += gui console
LDFLAGS     += -lcurl

include libs/get/Makefile
include libs/chesto/Makefile
