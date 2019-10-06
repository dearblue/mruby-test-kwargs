#include <mruby.h>
#include <mruby/class.h>
#include <mruby/array.h>

static mrb_value
c_getargs1(mrb_state *mrb, mrb_value self)
{
  mrb_value a = mrb_undef_value();
  mrb_value b = mrb_undef_value();
  mrb_value *argv;
  mrb_int argc;
  static const char *const knames[3] = { "x", "y", "z" };
  mrb_value opts, kvalues[3];
  const mrb_kwargs kwargs = { 3, kvalues, knames, 0, &opts };
  mrb_get_args(mrb, "|oo*:", &a, &b, &argv, &argc, &kwargs);

  mrb_value ret = mrb_ary_new_capa(mrb, 7);
  mrb_ary_push(mrb, ret, mrb_undef_p(a) ? mrb_str_new_cstr(mrb, "a") : a);
  mrb_ary_push(mrb, ret, mrb_undef_p(b) ? mrb_str_new_cstr(mrb, "b") : b);
  mrb_ary_push(mrb, ret, mrb_ary_new_from_values(mrb, argc, argv));
  mrb_ary_push(mrb, ret, mrb_undef_p(kvalues[0]) ? mrb_str_new_cstr(mrb, "x") : kvalues[0]);
  mrb_ary_push(mrb, ret, mrb_undef_p(kvalues[1]) ? mrb_str_new_cstr(mrb, "y") : kvalues[1]);
  mrb_ary_push(mrb, ret, mrb_undef_p(kvalues[2]) ? mrb_str_new_cstr(mrb, "z") : kvalues[2]);
  mrb_ary_push(mrb, ret, opts);

  return ret;
}

static mrb_value
c_getargs2(mrb_state *mrb, mrb_value self)
{
  mrb_value a = mrb_undef_value();
  mrb_value b = mrb_undef_value();
  mrb_value *argv;
  mrb_int argc;
  static const char *const knames[3] = { "x", "y", "z" };
  mrb_value kvalues[3];
  const mrb_kwargs kwargs = { 3, kvalues, knames, 3, NULL };
  mrb_get_args(mrb, ":oo*", &kwargs, &a, &b, &argv, &argc);

  mrb_value ret = mrb_ary_new_capa(mrb, 6);
  mrb_ary_push(mrb, ret, mrb_undef_p(a) ? mrb_str_new_cstr(mrb, "a") : a);
  mrb_ary_push(mrb, ret, mrb_undef_p(b) ? mrb_str_new_cstr(mrb, "b") : b);
  mrb_ary_push(mrb, ret, mrb_ary_new_from_values(mrb, argc, argv));
  mrb_ary_push(mrb, ret, kvalues[0]);
  mrb_ary_push(mrb, ret, kvalues[1]);
  mrb_ary_push(mrb, ret, kvalues[2]);

  return ret;
}

static mrb_value
c_getargs3(mrb_state *mrb, mrb_value self)
{
  mrb_value a = mrb_undef_value();
  mrb_value b = mrb_undef_value();
  mrb_value *argv;
  mrb_int argc;
  static const char *const knames[3] = { "x", "y", "z" };
  mrb_value kvalues[3];
  const mrb_kwargs kwargs = { 3, kvalues, knames, 0, NULL };
  mrb_get_args(mrb, ":oo*", &kwargs, &a, &b, &argv, &argc);

  mrb_value ret = mrb_ary_new_capa(mrb, 6);
  mrb_ary_push(mrb, ret, mrb_undef_p(a) ? mrb_str_new_cstr(mrb, "a") : a);
  mrb_ary_push(mrb, ret, mrb_undef_p(b) ? mrb_str_new_cstr(mrb, "b") : b);
  mrb_ary_push(mrb, ret, mrb_ary_new_from_values(mrb, argc, argv));
  mrb_ary_push(mrb, ret, mrb_undef_p(kvalues[0]) ? mrb_str_new_cstr(mrb, "x") : kvalues[0]);
  mrb_ary_push(mrb, ret, mrb_undef_p(kvalues[1]) ? mrb_str_new_cstr(mrb, "y") : kvalues[1]);
  mrb_ary_push(mrb, ret, mrb_undef_p(kvalues[2]) ? mrb_str_new_cstr(mrb, "z") : kvalues[2]);

  return ret;
}

void
mrb_mruby_test_kwargs_gem_test(mrb_state *mrb)
{
  mrb_define_method(mrb, mrb->object_class, "c_getargs1", c_getargs1, MRB_ARGS_ANY());
  mrb_define_method(mrb, mrb->object_class, "c_getargs2", c_getargs2, MRB_ARGS_ANY());
  mrb_define_method(mrb, mrb->object_class, "c_getargs3", c_getargs3, MRB_ARGS_ANY());
}
