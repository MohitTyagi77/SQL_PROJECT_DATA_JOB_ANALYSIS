/*
Question: 3. What are the top demanded skills for the data analyst?
- join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst,
- Focus on all job postings.
- Why? Retrives the top 5 skills with the highest demand in the job market,
- providing insights into the most sought-after skills for Data Analysts, helping job seekers prioritize skill development.
*/

select 
    skills,
    COUNT(skills_job_dim.job_id) as demand_count
From job_postings_fact
Inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

where
    job_title_short = 'Data Analyst' And job_work_from_home = 'True'

Group BY

    skills
order BY
    demand_count desc
limit 5;