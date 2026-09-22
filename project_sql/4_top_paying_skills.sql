/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skills for Data Analyst job postings.
- Focuses on roles with specified salaries, regardless of location
- Why? it reveals the most financially rewarding skills to acquire for Data Analysts, guiding career development and skill prioritization.
*/

select 
    skills,
    Round(Avg(salary_hour_avg),0) as avg_salary
From job_postings_fact
Inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

where
    job_title_short = 'Data Analyst' 
    AND salary_hour_avg IS NOT NULL
    AND job_work_from_home = 'True'

Group BY

    skills
order BY
    avg_salary desc
limit 25;