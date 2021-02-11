LOCAL_PATH := $(call get_local_path)
$( eval mkdir -p $(LOCAL_PATH) )
$( eval cmake -H $(LOCAL_PATH) -B $(LOCAL_PATH)/build )
$( eval make -f $(LOCAL_PATH)/build )
