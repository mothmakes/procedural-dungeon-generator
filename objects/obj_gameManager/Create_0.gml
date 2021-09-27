#region Setup Variables
Map = noone;
CollisionMap = noone;
#endregion

#region Views
//view_enabled = true;
//view_visible[0] = true;
//view_camera[0] = camera_create_view(0, 0, 640, 360, 0, noone, -1, -1, -1, -1);
#endregion

#region Objects
instance_create_layer(0,0,"Managers",obj_generatorManager);
#endregion