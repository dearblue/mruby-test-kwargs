MRuby::Gem::Specification.new("mruby-test-kwargs") do |s|
  s.author = "dearblue"
  s.license = "CC0"

  if cc.command =~ /\b(?:g?cc|clang)\d*\b/ && !build.cxx_abi_enabled?
    cc.flags << %w(-Wno-declaration-after-statement)
  end
end
