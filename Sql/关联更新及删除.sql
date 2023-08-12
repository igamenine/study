-- mysql
update test a, test_bak b set a.b = b.b where a.a =b.a;

delete a from test a, test_bak b where a.a = b.a;

