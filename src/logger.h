#pragma once

/***************************************************************************
 *   Copyright (C) 2008 by H-Store Project                                 *
 *   Brown University                                                      *
 *   Massachusetts Institute of Technology                                 *
 *   Yale University                                                       *
 *                                                                         *
 *   This software may be modified and distributed under the terms         *
 *   of the MIT license.  See the LICENSE file for details.                *
 *                                                                         *
 ***************************************************************************/

/**
 * @file logger.h
 * @brief Logging macros that can be optimized out
 * @author Hideaki, modified by Anuj (eRPC project) and Nikita
 */

#include <ctime>
#include <string>

namespace uptune {

// Log levels: higher means more verbose
#define LOG_LEVEL_OFF 0
#define LOG_LEVEL_ERROR 1
#define LOG_LEVEL_WARN 2
#define LOG_LEVEL_INFO 3
#define LOG_LEVEL_FLOW 4

#define LOG_DEFAULT_STREAM stdout

// If LOG_LEVEL is not defined, default to the highest level
#ifndef LOG_LEVEL
#define LOG_LEVEL LOG_LEVEL_INFO
#endif

static void output_log_header(int level);

#if LOG_LEVEL >= LOG_LEVEL_ERROR
#define ERROR(...)                                             \
  output_log_header(LOG_DEFAULT_STREAM, LOG_LEVEL_ERROR); \
  fprintf(LOG_DEFAULT_STREAM, __VA_ARGS__);                    \
  fflush(LOG_DEFAULT_STREAM)
#else
#define ERROR(...) ((void)0)
#endif

#if LOG_LEVEL >= LOG_LEVEL_WARN
#define WARN(...)                                             \
  output_log_header(LOG_DEFAULT_STREAM, LOG_LEVEL_WARN); \
  fprintf(LOG_DEFAULT_STREAM, __VA_ARGS__);                   \
  fflush(LOG_DEFAULT_STREAM)
#else
#define WARN(...) ((void)0)
#endif

#if LOG_LEVEL >= LOG_LEVEL_INFO
#define INFO(...)                                             \
  output_log_header(LOG_DEFAULT_STREAM, LOG_LEVEL_INFO); \
  fprintf(LOG_DEFAULT_STREAM, __VA_ARGS__);                   \
  fflush(LOG_DEFAULT_STREAM)
#else
#define INFO(...) ((void)0)
#endif

#if LOG_LEVEL >= LOG_LEVEL_FLOW
#define FLOW(...)                                             \
  output_log_header(LOG_DEFAULT_STREAM, LOG_LEVEL_FLOW); \
  fprintf(LOG_DEFAULT_STREAM, __VA_ARGS__);                   \
  fflush(LOG_DEFAULT_STREAM)
#else
#define FLOW(...) ((void)0)
#endif

/// Return decent-precision time formatted as seconds:microseconds
static std::string get_formatted_time() {
  struct timespec t;
  clock_gettime(CLOCK_REALTIME, &t);
  char buf[20];
  uint32_t seconds = t.tv_sec % 100;  // Rollover every 100 seconds
  uint32_t usec = t.tv_nsec / 1000;

  sprintf(buf, "%u:%06u", seconds, usec);
  return std::string(buf);
}

// Output log message header
static void output_log_header(FILE *stream, int level) {
  std::string formatted_time = get_formatted_time();

  const char *type;
  switch (level) {
    case LOG_LEVEL_ERROR: type = "ERROR"; break;
    case LOG_LEVEL_WARN: type = "WARNG"; break;
    case LOG_LEVEL_INFO: type = "INFOR"; break;
    default: type = "UNKWN";
  }

  fprintf(stream, "%s %s: ", formatted_time.c_str(), type);
}

}  // namespace frpc
