import 'zone.js';

// Fix for crossvent `global is not defined` error. The crossvent library is used by Dragula,
// which in turn is used by multiple SKY UX components.
// https://github.com/bevacqua/dragula/issues/602
// eslint-disable-next-line @typescript-eslint/no-explicit-any
(window as any).global = window;
