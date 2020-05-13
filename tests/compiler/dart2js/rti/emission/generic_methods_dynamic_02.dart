// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.7

// Based on language/generic_methods_dynamic_test/02

library generic_methods_dynamic_test;

/*spec:nnbd-off|spec:nnbd-sdk.class: A:checkedInstance,checks=[],typeArgument*/
/*prod:nnbd-off.class: A:*/
class A {}

/*spec:nnbd-off|spec:nnbd-sdk.class: B:checks=[],instance*/
/*prod:nnbd-off.class: B:*/
class B {}

/*class: C:*/
class C {
  T foo<T>(T t) => t;
  List<T> bar<T>(Iterable<T> t) => <T>[t.first];
}

@pragma('dart2js:disableFinal')
main() {
  B b = new B();
  C c = new C();
  dynamic obj = c;
  obj.foo<A>(b);
}