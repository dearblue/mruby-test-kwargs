def assert_args(p1, p2)
  begin
    p1 = p1.call
  rescue Exception => e
    p1 = e.to_s
  end

  begin
    p2 = p2.call
  rescue Exception => e
    p2 = e.to_s
  end

  assert_equal p1, p2
end

def mrb_getargs1(a = "a", b = "b", *args, x: "x", y: "y", z: "z", **opts)
  [a, b, args, x, y, z, opts]
end

assert "mrb_get_args (getargs1)" do
  assert_args -> { mrb_getargs1 }, -> { c_getargs1 }
  assert_args -> { mrb_getargs1(1) }, -> { c_getargs1(1) }
  assert_args -> { mrb_getargs1(1, 2, 3, 4) }, -> { c_getargs1(1, 2, 3, 4) }
  assert_args -> { mrb_getargs1(*nil) }, -> { c_getargs1(*nil) }
  assert_args -> { mrb_getargs1(**nil) }, -> { c_getargs1(**nil) }
  assert_args -> { mrb_getargs1({}, x: "X") }, -> { c_getargs1({}, x: "X") }
  assert_args -> { mrb_getargs1(**{}, x: "X") }, -> { c_getargs1(**{}, x: "X") }
  assert_args -> { mrb_getargs1(1, 2, 3, 4, x: "X") }, -> { c_getargs1(1, 2, 3, 4, x: "X") }
  assert_args -> { mrb_getargs1(**{ a: 1, b: 2 }, x: "X") }, -> { c_getargs1(**{ a: 1, b: 2 }, x: "X") }

  opts = { x: "x", y: "y", z: "z" }
  assert_args -> { mrb_getargs1(1, opts) }, -> { c_getargs1(1, opts) }
  assert_args -> { mrb_getargs1(1, 2, opts) }, -> { c_getargs1(1, 2, opts) }
  assert_args -> { mrb_getargs1(1, **opts) }, -> { c_getargs1(1, **opts) }
  assert_args -> { mrb_getargs1(1, 2, **opts) }, -> { c_getargs1(1, 2, **opts) }
end

def mrb_getargs2(a, b, *args, x:, y:, z:)
  [a, b, args, x, y, z]
end

assert "mrb_get_args (getargs2)" do
  #assert_args -> { mrb_getargs2 }, -> { c_getargs2 }
  #assert_args -> { mrb_getargs2(1) }, -> { c_getargs2(1) }
  assert_args -> { mrb_getargs2(1, 2, 3, 4) }, -> { c_getargs2(1, 2, 3, 4) }
  #assert_args -> { mrb_getargs2(*nil) }, -> { c_getargs2(*nil) }
  #assert_args -> { mrb_getargs2(**nil) }, -> { c_getargs2(**nil) }
  assert_args -> { mrb_getargs2({}, x: "X") }, -> { c_getargs2({}, x: "X") }
  #assert_args -> { mrb_getargs2(**{}, x: "X") }, -> { c_getargs2(**{}, x: "X") }
  assert_args -> { mrb_getargs2(1, 2, 3, 4, x: "X") }, -> { c_getargs2(1, 2, 3, 4, x: "X") }
  #assert_args -> { mrb_getargs2(**{ a: 1, b: 2 }, x: "X") }, -> { c_getargs2(**{ a: 1, b: 2 }, x: "X") }
  assert_args -> { mrb_getargs2(1, 2, x: "x", y: "y", z: "z") }, -> { c_getargs2(1, 2, x: "x", y: "y", z: "z") }
  assert_args -> { mrb_getargs2(1, 2, x: "x", y: "y", z: "z", w: "w") }, -> { c_getargs2(1, 2, x: "x", y: "y", z: "z", w: "w") }

  opts = { x: "x", y: "y", z: "z" }
  #assert_args -> { mrb_getargs2(1, opts) }, -> { c_getargs2(1, opts) }
  assert_args -> { mrb_getargs2(1, 2, opts) }, -> { c_getargs2(1, 2, opts) }
  #assert_args -> { mrb_getargs2(1, **opts) }, -> { c_getargs2(1, **opts) }
  assert_args -> { mrb_getargs2(1, 2, **opts) }, -> { c_getargs2(1, 2, **opts) }
end

def mrb_getargs3(a, b, *args, x: "x", y: "y", z: "z")
  [a, b, args, x, y, z]
end

assert "mrb_get_args (getargs3)" do
  #assert_args -> { mrb_getargs3 }, -> { c_getargs3 }
  #assert_args -> { mrb_getargs3(1) }, -> { c_getargs3(1) }
  assert_args -> { mrb_getargs3(1, 2, 3, 4) }, -> { c_getargs3(1, 2, 3, 4) }
  #assert_args -> { mrb_getargs3(*nil) }, -> { c_getargs3(*nil) }
  #assert_args -> { mrb_getargs3(**nil) }, -> { c_getargs3(**nil) }
  assert_args -> { mrb_getargs3({}, x: "X") }, -> { c_getargs3({}, x: "X") }
  #assert_args -> { mrb_getargs3(**{}, x: "X") }, -> { c_getargs3(**{}, x: "X") }
  assert_args -> { mrb_getargs3(1, 2, 3, 4, x: "X") }, -> { c_getargs3(1, 2, 3, 4, x: "X") }
  #assert_args -> { mrb_getargs3(**{ a: 1, b: 2 }, x: "X") }, -> { c_getargs3(**{ a: 1, b: 2 }, x: "X") }
  assert_args -> { mrb_getargs3(1, 2, x: "x", y: "y", z: "z") }, -> { c_getargs3(1, 2, x: "x", y: "y", z: "z") }
  assert_args -> { mrb_getargs3(1, 2, x: "x", y: "y", z: "z", w: "w") }, -> { c_getargs3(1, 2, x: "x", y: "y", z: "z", w: "w") }

  opts = { x: "x", y: "y", z: "z" }
  assert_args -> { mrb_getargs3(1, opts) }, -> { c_getargs3(1, opts) }
  assert_args -> { mrb_getargs3(1, 2, opts) }, -> { c_getargs3(1, 2, opts) }
  assert_args -> { mrb_getargs3(1, **opts) }, -> { c_getargs3(1, **opts) }
  assert_args -> { mrb_getargs3(1, 2, **opts) }, -> { c_getargs3(1, 2, **opts) }
end

def mrb_getargs4(a = "a", b = "b", x: "x", y: "y", z: "z")
  [a, b, x, y, z]
end

assert "mrb_get_args (getargs4)" do
  assert_args -> { mrb_getargs4 }, -> { c_getargs4 }
  assert_args -> { mrb_getargs4(1) }, -> { c_getargs4(1) }
  #assert_args -> { mrb_getargs4(1, 2, 3, 4) }, -> { c_getargs4(1, 2, 3, 4) }
  assert_args -> { mrb_getargs4(*nil) }, -> { c_getargs4(*nil) }
  assert_args -> { mrb_getargs4(**nil) }, -> { c_getargs4(**nil) }
  assert_args -> { mrb_getargs4({}, x: "X") }, -> { c_getargs4({}, x: "X") }
  assert_args -> { mrb_getargs4(**{}, x: "X") }, -> { c_getargs4(**{}, x: "X") }
  #assert_args -> { mrb_getargs4(1, 2, 3, 4, x: "X") }, -> { c_getargs4(1, 2, 3, 4, x: "X") }
  assert_args -> { mrb_getargs4(**{ a: 1, b: 2 }, x: "X") }, -> { c_getargs4(**{ a: 1, b: 2 }, x: "X") }

  opts = { x: "x", y: "y", z: "z" }
  assert_args -> { mrb_getargs4(1, opts) }, -> { c_getargs4(1, opts) }
  assert_args -> { mrb_getargs4(1, 2, opts) }, -> { c_getargs4(1, 2, opts) }
  assert_args -> { mrb_getargs4(1, **opts) }, -> { c_getargs4(1, **opts) }
  assert_args -> { mrb_getargs4(1, 2, **opts) }, -> { c_getargs4(1, 2, **opts) }
end
