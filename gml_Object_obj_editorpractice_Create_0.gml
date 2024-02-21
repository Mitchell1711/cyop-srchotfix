//only one is allowed to exist
if (instance_number(object_index) > 1)
{
    instance_destroy()
    return;
}
global.savestates = array_create(10)
saveslot = 0
