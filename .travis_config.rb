#ruby

MRuby::Build.new do |c|
  toolchain "gcc"
  enable_test

  c.build_dir = File.join(MRUBY_ROOT, "build/mruby-test-kwargs")
  cc.flags << %w(-Og -g3)
  cxx.flags << %w(-Og -g3)
  cc.defines << %w(MRB_ENABLE_KEYWORD_SPECIFIER)
  cxx.defines << %w(MRB_ENABLE_KEYWORD_SPECIFIER)

  gem core: "mruby-bin-mruby"
  gem __dir__
end

MRuby::Build.new("mruby-test-kwargs++") do |c|
  toolchain "gcc"
  enable_cxx_abi
  enable_test

  c.build_dir = File.join(MRUBY_ROOT, "build/mruby-test-kwargs++")
  cc.flags << %w(-Og -g3)
  cxx.flags << %w(-Og -g3)
  cc.defines << %w(MRB_ENABLE_KEYWORD_SPECIFIER)
  cxx.defines << %w(MRB_ENABLE_KEYWORD_SPECIFIER)

  gem core: "mruby-bin-mruby"
  gem __dir__
end
