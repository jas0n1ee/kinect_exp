#include "stdafx.h"
struct kinectdata{
	INT8 Body_index;
	INT8 tracked_num;
	INT16 Body_x[25];
	INT16 Body_y[25];
	INT16 Body_depth[25];
	INT64 Time;
};