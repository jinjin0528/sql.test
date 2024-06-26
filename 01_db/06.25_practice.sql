-- <JOIN 미사용 연습문제>
-- 1. 모든 사원 모든 컬럼 조회 
SELECT
		*
	FROM employee ;

  
-- 2. 사원들의 사번(사원번호), 이름 조회
SELECT
		emp_id
		,emp_name
		FROM employee;

  
-- 3. 201번 사번의 사번 및 이름 조회
SELECT
		emp_id
		,emp_name
		FROM employee
		WHERE emp_id = 201;

 
-- 4. employee 테이블에서 부서 코드가 'D9'인 사원 조회
SELECT
		*
	FROM employee
	WHERE dept_code = 'D9';
 
-- 5. employee 테이블에서 직급 코드가 'J1'인 사원 조회
SELECT
		*
	FROM employee
	WHERE job_code = 'J1';
 
-- 6. employee 테이블에서 급여가 300만원 이상(>=)인 사원의
-- 사번, 이름, 부서코드, 급여를 조회하시오.
SELECT
		emp_id
		,emp_name
		,dept_code
		,FLOOR(salary)
		FROM employee
		WHERE salary >= 3000000;
		


-- 7. 부서코드가 'D6'이고 급여를 300만원보다 많이 받는
-- 직원의 이름, 부서코드, 급여 조회
SELECT
		emp_name
		,dept_code
		,FLOOR(salary) AS 급여
		FROM employee
		WHERE salary > 3000000
		AND dept_code LIKE 'd6';

-- 8. 보너스를 받지 않는 사원에 대한
-- 사번, 직원명, 급여, 보너스를 조회
SELECT
		EMP_ID
		,emp_name
		,FLOOR(salary) AS 급여
		,bonus 
	FROM employee
	WHERE bonus IS NULL;	-- error
 
-- 9. 'D9' 부서에서 근무하지 않는 사원의
-- 사번, 이름, 부서코드를 조회
SELECT
		emp_id
		,emp_name
		,dept_code
	FROM employee
	WHERE dept_code != 'd9';
 
-- 10. employee 테이블에서 퇴사 여부가 N인 직원들 조회하고
-- 사번, 이름, 입사일을 별칭을 사용해 조회해 보기
-- (퇴사 여부 컬럼은 ENT_YN이고 N은 퇴사 안한 사람, Y는 퇴사 한 사람)

SELECT
		a.EMP_ID AS 사번
		,a.EMP_NAME	AS 이름
		,a.HIRE_DATE AS 입사일
	FROM employee a
	WHERE a.ENT_YN = 'n';
	
-- 11. employee 테이블에서 급여 350만원 이상
-- 550만원 이하를 받는 직원의
-- 사번, 이름, 급여, 부서코드, 직급코드를 별칭을 사용해 조회해 보기
SELECT
		a.emp_id AS 사번
		,a.EMP_NAME AS 이름
		,floor(a.SALARY) AS 급여
		,a.DEPT_CODE AS 부서코드
		,a.job_code AS 직급코드
	FROM employee a
	WHERE a.SALARY >= 3500000
	AND a.SALARY <= 5500000;
	-- WHERE salary BETWEEN 3500000 AND 5500000;
	
-- 12. employee 테이블에서 '성이 김씨'인 직원의 사번, 이름, 입사일 조회
SELECT
		emp_id
		,emp_name
		,hire_date
	FROM employee
	WHERE emp_name LIKE '김%';
 
-- 13. employee 테이블에서 '성이 김씨'가 아닌 직원의 사번, 이름, 입사일 조회
SELECT
		emp_id
		,emp_name
		,hire_date
	FROM employee
	WHERE emp_name not LIKE '김%'	--  =NOT emp_name LIKE '김%';
	ORDER BY emp_name asc;

-- 14. EMPLOYEE 테이블에서 '하'문자가 이름에 포함 된
-- 직원의 이름, 주민번호, 부서코드 조회
SELECT
		a.EMP_NAME
		,a.EMP_NO
		,a.DEPT_CODE
	FROM employee a
	WHERE a.EMP_NAME LIKE '하%';
 
-- 15. 'J2'직급이면서 급여가 200만원 이상인 직원이거나
-- 'J7'직급인 직원의 이름, 급여, 직급코드 조회
SELECT
		a.EMP_NAME
		,floor(a.SALARY)
		,a.job_code
	FROM employee a
	WHERE a.job_code like 'j2'
	AND a.SALARY >= 2000000
	OR a.JOB_CODE = 'j7';
 
-- 16. 'J2'직급이거나 'J7'직급인 직원들 중에
-- 급여가 200만원 이상인 직원의 이름, 급여, 직급코드 조회

SELECT
		emp_name
		, salary
		,job_code
	FROM employee
	WHERE (job_code LIKE 'j2'
	OR job_code LIKE 'j7')
	AND salary >= 2000000;

-- 17. IN 연산자로 업그레이드
SELECT
		emp_name
		, salary
		,job_code
	FROM employee
	WHERE job_code IN ('j2', 'j7')	-- in 연산자에서는 ('')사용
	AND salary >= 2000000;

-- ------------------------------------------
-- <JOIN 사용 연습문제>              

-- 1. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.(1명)
SELECT
		a.EMP_ID
		,a.EMP_NAME
		,a.DEPT_CODE
	FROM employee a
	LEFT JOIN DEPARTMENT B ON (A.DEPT_CODE = B.DEPT_ID)
 WHERE A.EMP_NAME LIKE '%형%';


-- 2. 해외영업팀에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.(9명)
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

-- 해외영업팀 부서 코드 조회
SELECT
       A.DEPT_ID
  FROM DEPARTMENT A
 WHERE A.DEPT_TITLE LIKE '%해외영업%'; 
 
SELECT
       A.EMP_NAME "사원명"
     , C.JOB_NAME "직급명"
     , A.DEPT_CODE "부서코드"
     , B.DEPT_TITLE "부서명"
  FROM EMPLOYEE A
  JOIN DEPARTMENT B ON (A.DEPT_CODE = B.DEPT_ID)
  JOIN JOB C ON (A.JOB_CODE = C.JOB_CODE)
 WHERE A.DEPT_CODE IN ('D5', 'D6', 'D7');


-- 3. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.(8명)(INNER JOIN 결과)
SELECT
       A.EMP_NAME
     , A.BONUS
     , B.DEPT_TITLE
     , C.LOCAL_NAME
  FROM EMPLOYEE A
  JOIN DEPARTMENT B ON (A.DEPT_CODE = B.DEPT_ID)
  JOIN LOCATION C ON (B.LOCATION_ID = C.LOCAL_CODE)
 WHERE A.BONUS IS NOT NULL;
  
SELECT * FROM LOCATION;
SELECT * FROM DEPARTMENT;


-- 4. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.(3명)
SELECT
       A.EMP_NAME "사원명"
     , C.JOB_NAME "직급명"
     , B.DEPT_TITLE "부서명"
     , D.LOCAL_NAME "근무지역명"
  FROM EMPLOYEE A
  JOIN DEPARTMENT B ON (A.DEPT_CODE = B.DEPT_ID)
  JOIN JOB C ON (A.JOB_CODE = C.JOB_CODE)
  JOIN LOCATION D ON (B.LOCATION_ID = D.LOCAL_CODE)
 WHERE B.DEPT_ID = 'D2';

-- 5. 급여 테이블의 등급별 최소급여(MIN_SAL)보다 많이 받는 직원들의
-- 사원명, 직급명, 급여, 연봉을 조회하시오.
-- 연봉에 보너스포인트를 적용하시오.(20명)
SELECT
		a.EMP_NAME
		,a.SAL_LEVEL
		,a.SALARY
		, a.SALARY * ( 1 + IFNULL(A.BONUS, 0)) * 12
  FROM EMPLOYEE a
  JOIN JOB b ON (a.JOB_CODE = b.JOB_CODE)
  JOIN SAL_GRADE c ON (a.SAL_LEVEL = c.SAL_LEVEL)
 WHERE a.SALARY > c.MIN_SAL;
 FROM employee a
 
-- 6. 한국(KO)과 일본(JP)에 근무하는 직원들의 
-- 사원명, 부서명, 지역명, 국가명을 조회하시오.(15명)
SELECT
       A.EMP_NAME "사원명"
     , B.DEPT_TITLE "부서명"
     , C.LOCAL_NAME "지역명"
     , D.NATIONAL_NAME "국가명"
  FROM EMPLOYEE A
  JOIN DEPARTMENT B ON (A.DEPT_CODE = B.DEPT_ID)
  JOIN LOCATION C ON (B.LOCATION_ID = C.LOCAL_CODE)
  JOIN NATIONAL D ON (C.NATIONAL_CODE = D.NATIONAL_CODE)
 WHERE C.NATIONAL_CODE IN ('KO', 'JP');

SELECT * FROM DEPARTMENT;
SELECT * FROM LOCATION;
SELECT * FROM national;

-- 7. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회하시오.
-- self join 사용(60명)
SELECT
       A.EMP_NAME
     , A.DEPT_CODE
     , B.EMP_NAME
  FROM EMPLOYEE A
  JOIN EMPLOYEE B ON (A.DEPT_CODE = B.DEPT_CODE)  
 WHERE A.EMP_ID != B.EMP_ID                      
 ORDER BY 1;    

-- 8. 보너스포인트가 없는 직원들 중에서 직급코드가 J4와 J7인 직원들의 사원명, 직급명, 급여를 조회하시오.
-- 단, join과 IN 사용할 것(8명)
SELECT
       A.EMP_NAME
     , B.JOB_NAME
     , A.SALARY
  FROM EMPLOYEE A
  JOIN JOB B ON (A.JOB_CODE = B.JOB_CODE)
 WHERE A.JOB_CODE IN ('J4', 'J7')
   AND BONUS IS NULL;

-- 9. 직급이 대리이면서 아시아 지역(ASIA1, ASIA2, ASIA3 모두 해당)에 근무하는 직원 조회
-- 사번(EMPLOYEE.EMP_ID), 이름(EMPLOYEE.EMP_NAME), 직급명(JOB.JOB_NAME), 부서명(DEPARTMENT.DEPT_TITLE),
-- 근무지역명(LOCATION.LOCAL_NAME), 급여(EMPLOYEE.SALARY)를 조회하시오
-- (해당 컬럼을 찾고, 해당 컬럼을 지닌 테이블들을 찾고, 테이블들을 어떤 순서로 조인해야 하는지 고민하고 SQL문을 작성할 것)
SELECT
       A.EMP_ID
     , A.EMP_NAME
     , B.JOB_NAME
     , C.DEPT_TITLE
     , D.LOCAL_NAME
     , A.SALARY
  FROM EMPLOYEE A
  JOIN JOB B ON (A.JOB_CODE = B.JOB_CODE)
  JOIN DEPARTMENT C ON (A.DEPT_CODE = C.DEPT_ID)
  JOIN LOCATION D ON (C.LOCATION_ID = D.LOCAL_CODE)
 WHERE B.JOB_NAME = '대리'
--   AND D.LOCAL_NAME IN ('ASIA1', 'ASIA2', 'ASIA3');
   AND D.LOCAL_NAME LIKE '%ASIA%';