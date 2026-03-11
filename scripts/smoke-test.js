const assert = require('assert');
const { createApp } = require('../server');

function findRouteHandler(app, path, method = 'get') {
  const stack = app._router && app._router.stack ? app._router.stack : [];

  for (const layer of stack) {
    if (!layer.route || layer.route.path !== path) continue;
    if (!layer.route.methods || !layer.route.methods[method]) continue;

    return layer.route.stack[0].handle;
  }

  return null;
}

function runHealthHandler(handler) {
  let statusCode = null;
  let payload = null;

  const res = {
    status(code) {
      statusCode = code;
      return this;
    },
    json(value) {
      payload = value;
      return this;
    }
  };

  handler({}, res);
  return { statusCode, payload };
}

function main() {
  const app = createApp();
  const healthHandler = findRouteHandler(app, '/health');
  assert.ok(healthHandler, 'Expected GET /health route to exist');

  const { statusCode, payload } = runHealthHandler(healthHandler);
  assert.strictEqual(statusCode, 200, 'Expected /health to return HTTP 200');
  assert.deepStrictEqual(payload, { ok: true }, 'Expected /health payload { ok: true }');

  console.log('Smoke test passed: /health route exists and returns 200 with { ok: true }.');
}

main();
