const taskName = process.argv[2] || 'task';

console.log(`[${taskName}] No persistent database configured for this project. Skipping ${taskName} step.`);
