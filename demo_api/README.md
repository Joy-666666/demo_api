# Demo API

一个基于 **Ruby on Rails 7** 的最小化 API 示例项目，包含 **CRUD 用户管理** 和 **全局异常处理**，支持 **RSpec 单元测试和请求测试**。

This is a minimal Ruby on Rails 7 API demo project, providing CRUD operations for user management with global error handling. Fully covered by RSpec model and request tests.

---

## 功能 Features

- 用户（User）管理：
  - 列表查询 `GET /api/v1/users`
  - 查询单个用户 `GET /api/v1/users/:id`
  - 创建用户 `POST /api/v1/users`
  - 删除用户 `DELETE /api/v1/users/:id`
- 全局异常处理：
  - `ActiveRecord::RecordNotFound` → 返回 404
  - `ActionController::ParameterMissing` → 返回 422
  - 所有其他未捕获异常 → 返回 500
- RSpec 单元测试和请求测试覆盖所有核心功能

---

## 技术栈 Stack

- Ruby 3.2.x
- Rails 7.2.x
- PostgreSQL
- RSpec + FactoryBot
- Database Cleaner
- Puma Web Server

---

## 安装 Installation

1. 克隆仓库

```bash
git clone <repository_url>
cd demo_api
```

2. 安装依赖

```bash
bundle install
```

3. 数据库创建与迁移

```bash
rails db:create db:migrate
rails db:create db:migrate RAILS_ENV=test
```

---

## 启动服务 Run Server

```bash
rails server
```

默认监听 `http://localhost:3000`

---

## API 使用说明 API Usage

### 1. 获取所有用户

```
GET /api/v1/users
```

**响应示例 Response:**

```json
[
  {
    "id": 1,
    "name": "Joy",
    "created_at": "2025-12-04T08:00:00.000Z",
    "updated_at": "2025-12-04T08:00:00.000Z"
  }
]
```

### 2. 查询单个用户

```
GET /api/v1/users/:id
```

**成功返回 200：**

```json
{
  "id": 1,
  "name": "Joy",
  "created_at": "2025-12-04T08:00:00.000Z",
  "updated_at": "2025-12-04T08:00:00.000Z"
}
```

**用户不存在返回 404：**

```json
{
  "error": {
    "message": "Couldn't find User with 'id'=9999",
    "details": "Record not found"
  }
}
```

### 3. 创建用户

```
POST /api/v1/users
Content-Type: application/json
Body: { "user": { "name": "Alice" } }
```

**成功返回 201：**

```json
{
  "id": 2,
  "name": "Alice",
  "created_at": "2025-12-04T08:05:00.000Z",
  "updated_at": "2025-12-04T08:05:00.000Z"
}
```

**参数缺失或验证失败返回 422：**

```json
{
  "error": {
    "message": "Validation failed",
    "details": ["Name can't be blank"]
  }
}
```

**缺少 user key：**

```json
{
  "error": {
    "message": "param is missing or the value is empty: user",
    "details": "Required parameter missing or invalid"
  }
}
```

### 4. 删除用户

```
DELETE /api/v1/users/:id
```

**成功返回：**

```json
{
  "message": "deleted",
  "id": 2
}
```

**用户不存在返回 404：**

```json
{
  "error": {
    "message": "Couldn't find User with 'id'=9999",
    "details": "Record not found"
  }
}
```

---

## 运行测试 Run Tests

```bash
bundle exec rspec
```

- 全部测试覆盖模型验证、API 请求及异常处理
- 使用 Database Cleaner 确保每个测试用例数据库干净

---

## 文件结构 Project Structure

```
app/
  controllers/
    api/v1/users_controller.rb
    application_controller.rb
  models/
    user.rb
db/
  migrate/
    xxxx_create_users.rb
spec/
  models/user_spec.rb
  requests/api/v1/users_spec.rb
config/
  routes.rb
Gemfile
```

---

## 贡献 Contribution

欢迎 Fork 或者提交 PR，保持项目轻量、可扩展、易于测试。

---

## License

MIT License

