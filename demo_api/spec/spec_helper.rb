# frozen_string_literal: true

RSpec.configure do |config|
  # 保持运行顺序随机
  config.order = :random

  # 打印失败示例的详细信息
  config.example_status_persistence_file_path = "spec/examples.txt"

  # 使用 expect {...}.to change(...) 风格
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
