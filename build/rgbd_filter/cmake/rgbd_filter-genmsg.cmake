# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "rgbd_filter: 1 messages, 0 services")

set(MSG_I_FLAGS "-Irgbd_filter:/home/daniel/catkin_ws/src/rgbd_filter/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(rgbd_filter_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/daniel/catkin_ws/src/rgbd_filter/msg/CustomArray.msg" NAME_WE)
add_custom_target(_rgbd_filter_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "rgbd_filter" "/home/daniel/catkin_ws/src/rgbd_filter/msg/CustomArray.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(rgbd_filter
  "/home/daniel/catkin_ws/src/rgbd_filter/msg/CustomArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgbd_filter
)

### Generating Services

### Generating Module File
_generate_module_cpp(rgbd_filter
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgbd_filter
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(rgbd_filter_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(rgbd_filter_generate_messages rgbd_filter_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/daniel/catkin_ws/src/rgbd_filter/msg/CustomArray.msg" NAME_WE)
add_dependencies(rgbd_filter_generate_messages_cpp _rgbd_filter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rgbd_filter_gencpp)
add_dependencies(rgbd_filter_gencpp rgbd_filter_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rgbd_filter_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(rgbd_filter
  "/home/daniel/catkin_ws/src/rgbd_filter/msg/CustomArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgbd_filter
)

### Generating Services

### Generating Module File
_generate_module_eus(rgbd_filter
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgbd_filter
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(rgbd_filter_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(rgbd_filter_generate_messages rgbd_filter_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/daniel/catkin_ws/src/rgbd_filter/msg/CustomArray.msg" NAME_WE)
add_dependencies(rgbd_filter_generate_messages_eus _rgbd_filter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rgbd_filter_geneus)
add_dependencies(rgbd_filter_geneus rgbd_filter_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rgbd_filter_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(rgbd_filter
  "/home/daniel/catkin_ws/src/rgbd_filter/msg/CustomArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgbd_filter
)

### Generating Services

### Generating Module File
_generate_module_lisp(rgbd_filter
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgbd_filter
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(rgbd_filter_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(rgbd_filter_generate_messages rgbd_filter_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/daniel/catkin_ws/src/rgbd_filter/msg/CustomArray.msg" NAME_WE)
add_dependencies(rgbd_filter_generate_messages_lisp _rgbd_filter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rgbd_filter_genlisp)
add_dependencies(rgbd_filter_genlisp rgbd_filter_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rgbd_filter_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(rgbd_filter
  "/home/daniel/catkin_ws/src/rgbd_filter/msg/CustomArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgbd_filter
)

### Generating Services

### Generating Module File
_generate_module_nodejs(rgbd_filter
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgbd_filter
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(rgbd_filter_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(rgbd_filter_generate_messages rgbd_filter_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/daniel/catkin_ws/src/rgbd_filter/msg/CustomArray.msg" NAME_WE)
add_dependencies(rgbd_filter_generate_messages_nodejs _rgbd_filter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rgbd_filter_gennodejs)
add_dependencies(rgbd_filter_gennodejs rgbd_filter_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rgbd_filter_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(rgbd_filter
  "/home/daniel/catkin_ws/src/rgbd_filter/msg/CustomArray.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgbd_filter
)

### Generating Services

### Generating Module File
_generate_module_py(rgbd_filter
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgbd_filter
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(rgbd_filter_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(rgbd_filter_generate_messages rgbd_filter_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/daniel/catkin_ws/src/rgbd_filter/msg/CustomArray.msg" NAME_WE)
add_dependencies(rgbd_filter_generate_messages_py _rgbd_filter_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(rgbd_filter_genpy)
add_dependencies(rgbd_filter_genpy rgbd_filter_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS rgbd_filter_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgbd_filter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/rgbd_filter
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(rgbd_filter_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgbd_filter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/rgbd_filter
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(rgbd_filter_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgbd_filter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/rgbd_filter
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(rgbd_filter_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgbd_filter)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/rgbd_filter
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(rgbd_filter_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgbd_filter)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgbd_filter\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/rgbd_filter
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(rgbd_filter_generate_messages_py std_msgs_generate_messages_py)
endif()
