# SQL执行顺序
#
#	from ==> where ==> group by (可含聚合函数)... having (不可含聚合函数)... ==> select ==> order by
#

# MySQL
-- 1.1 检索所有行和列
select * from emp; # “*” 表示返回所有列
-- 1.2 筛选行
select * from emp where deptno = 20; # 通过“where”条件筛选
-- 1.3 查找满足多个条件的行
select * from emp where deptno = 20 and job = 'CLERK'; # 使用“and”、“or”拼接多个条件
-- 1.4 筛选列
select ename, deptno, sal from emp;
-- 1.5 创建有意义的列名
select sal as salary from emp; # 通过“as”取别名
-- 1.6 《在where子句中引用别名列》
select sal as salary from emp where salary < 5000; #(别名不能直接在where后用，会报错，原因：where执行在select之前)
select * from (
	select sal as salary from emp
) e where salary < 5000; # 可以把查询包装为一个内嵌视图
-- 1.7 《串联多列的值》
select CONCAT(ename, ' works as a ', job) as msg from emp; # 使用“concat”函数拼接字符串
-- 1.8 《在select语句里使用条件逻辑》select
	ename,
	sal,
	case 
		when sal < 2000 then 'underpaid'
		when sal > 4000 then 'overpaid'
		else 'ok'
	end as status
from emp; # “case when ... then ... else” 等价于 if else；如果没有“else”且case表达式不满足条件的行，case表达式会返回Null
-- 1.9 限定返回的行
select * from emp limit 1;


