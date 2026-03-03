# SQL--gym-attendance-analysis
🏋️ Gym Attendance &amp; Workout Analysis - SQL Project

## Dataset used
-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/daily_gym_attendance_workout_data.csv">RAW.gym-analysis-dataset</a>

---

## 📊 Project Overview

This SQL project analyzes gym attendance, workout patterns, and member behavior to provide actionable insights for gym management. The analysis covers peak hours, workout preferences, attendance patterns, and factors influencing member engagement.

---

## 🛢️ Database & Tools

| Component | Details |
|-----------|---------|
| **Database** | MySQL 8.0 |
| **Tool Used** | MySQL Workbench |
| **Techniques** | Data cleaning, CTEs, aggregations, date functions, filtering, grouping, window functions, CASE statements |


---

## 🎯 Project Objectives

1. **Identify Peak Visit Hours** - Optimize staff scheduling
2. **Analyze Workout Preferences** - Understand member demographics
3. **Track Attendance Patterns** - Reduce no-show rates
4. **Determine Key Factors** - Influencing workout duration & frequency
5. **Generate Actionable Insights** - For gym management

---

## 📁 Database Structure

### Main Table: `gym_staging`

| Column | Description | Data Type |
|--------|-------------|-----------|
| member_id | Unique member identifier | INT |
| visit_date | Date of visit | DATE |
| age | Member age | INT |
| gender | Member gender | VARCHAR |
| membership_type | Type of membership | VARCHAR |
| workout_type | Type of workout | VARCHAR |
| workout_duration_minutes | Duration in minutes | INT |
| calories_burned | Calories burned | INT |
| check_in_time | Time of check-in | TIME |
| attendance_status | Present/Absent | VARCHAR |

---

## 📊 Key Business Questions Answered

| # | Question | SQL File |
|:--:|----------|----------|
| 1 | Member Behavior analysis by peak hours visit? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/01_Member_Behavior_analysis.sql">SQL-query</a> |
| 2 | Busiest time slots for staff scheduling? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/02_busiest_time_slot.sql">SQL-query</a> |
| 3 | Workout preferences by age group and gender? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/03_workout_preferences.sql">SQL-query</a> |
| 4 | Top workout types by membership type? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/04_top_workout_type.sql">SQL-query</a> |
| 5 | Time of day preferences by demographic and workout type? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/05_Time_of_day_preferences.sql">SQL-query</a> |
| 6 | Overall attendance vs no-show rates? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/06_overall_attendance.sql">SQL-query</a> |
| 7 | No-show patterns by day and time? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/07_no_show_patterns.sql">SQL-query</a> |
| 8 | No-show patterns by membership type? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/08_no_show_pattern_by_member_type.sql">SQL-query</a> |
| 9 | Factors Influencing Workout Duration & Frequency? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/09_factors_workout.sql">SQL-query</a> |
| 10 | Correlation between membership type and workout frequency/duration? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/10_correlations_between_member.sql">SQL-query</a> |
| 11 | Age and gender impact on workout patterns? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/11_age_and_gender_impact.sql">SQL-query</a> |
| 12 | Seasonal/monthly patterns? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/12_seasonal_patterns.sql">SQL-query</a>|
| 13 | Personalized recommendation opportunities? |-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/13_personalized_recommendation.sql">SQL-query</a> |


---

# 📊 Peak Hours Analysis: Key Findings & Insights

## Overview
This analysis examines gym visit patterns across different days and hours to optimize staff scheduling and resource allocation.

---

## 📈 Finding 1: Monday - Bimodal Distribution

**Data:**

| Hour | Visits | Percentage | Pattern |
|------|--------|------------|---------|
| 4 PM (16:00) | 15 | 23.08% | 🥇 Afternoon Peak |
| 5 AM (05:00) | 14 | 21.54% | 🥈 Early Bird |
| 7 AM (07:00) | 12 | 18.46% | 🥉 Morning Rush |
| 6 PM (18:00) | 12 | 18.46% | 🥉 Evening Rush |
| 8 AM (08:00) | 12 | 18.46% | 🥉 Late Morning |

### 🔍 Key Finding
Monday shows a unique bimodal distribution with two distinct peaks:
- **Early Morning (5 AM)** : 21.54% - "Monday motivation" early birds
- **Afternoon (4 PM)** : 23.08% - Post-work/school crowd

### 💡 Insight
The 5 AM peak suggests dedicated members starting their week strong, while the 4 PM peak captures the after-work crowd. The even spread across multiple hours (7 AM, 6 PM, 8 AM all at 18.46%) shows Monday has the most distributed attendance pattern of the week.

### ✅ Action Items
| Priority | Action | Timeline |
|----------|--------|----------|
| 🔴 High | Schedule Wave 1: 4 AM - 9 AM staff | Immediate |
| 🔴 High | Schedule Wave 2: 3 PM - 8 PM staff | Immediate |
| 🟡 Medium | Monitor if 5 AM crowd needs extra equipment | Weekly |

---

## 📈 Finding 2: Tuesday - Early Morning Dominance

**Data:**

| Hour | Visits | Percentage | Pattern |
|------|--------|------------|---------|
| 5 AM (05:00) | 15 | 23.44% | 🥇 Strong Peak |
| 4 PM (16:00) | 13 | 20.31% | 🥈 Afternoon |
| 6 PM (18:00) | 13 | 20.31% | 🥈 Evening |
| 7 AM (07:00) | 12 | 18.75% | 🥉 Morning |
| 10 PM (22:00) | 11 | 17.19% | 📈 Late Night |

### 🔍 Key Finding
Tuesday's clear winner is **5 AM (23.44%)** , significantly ahead of other hours. Notably, **10 PM appears** in the top 5 with 17.19%.

### 💡 Insight
- Early morning momentum continues from Monday
- The 10 PM appearance suggests night owls or shift workers
- Afternoon/evening hours (4 PM, 6 PM) remain strong but secondary

### ✅ Action Items
| Priority | Action | Timeline |
|----------|--------|----------|
| 🔴 High | Keep early morning staff (4 AM - 8 AM) | Immediate |
| 🟡 Medium | Add limited late-night coverage (9 PM - 11 PM) | Next week |
| 🟢 Low | Promote "Late Night Tuesday" specials | Monthly |

---

## 📈 Finding 3: Wednesday - Morning Peak with Afternoon Surprise

**Data:**

| Hour | Visits | Percentage | Pattern |
|------|--------|------------|---------|
| 7 AM (07:00) | 17 | 24.64% | 🥇 Peak |
| 2 PM (14:00) | 14 | 20.29% | 🥈 Afternoon |
| 11 AM (11:00) | 13 | 18.84% | 🥉 Late Morning |
| 7 PM (19:00) | 13 | 18.84% | 🥉 Evening |
| 12 PM (12:00) | 12 | 17.39% | Lunch |

### 🔍 Key Finding
Wednesday's **7 AM is the absolute peak (24.64%)** - the highest percentage across all days analyzed. An unusual **2 PM afternoon peak** appears.

### 💡 Insight
- "Hump day" motivation drives the strongest morning crowd of the week
- The 2 PM peak suggests lunch-hour extenders or flexible schedules
- Mid-day hours (11 AM, 12 PM) are unusually strong

### ✅ Action Items
| Priority | Action | Timeline |
|----------|--------|----------|
| 🔴 High | Maximum morning staff (4 AM - 9 AM) | Immediate |
| 🟡 Medium | Add afternoon coverage (11 AM - 3 PM) | Next week |
| 🟢 Low | Offer mid-day class specials | Monthly |

---

## 📈 Finding 4: Thursday - Afternoon Focus

**Data:**

| Hour | Visits | Percentage | Pattern |
|------|--------|------------|---------|
| 1 PM (13:00) | 12 | 23.08% | 🥇 Peak |
| 5 PM (17:00) | 11 | 21.15% | 🥈 Evening |
| 9 AM (09:00) | 10 | 19.23% | 🥉 Morning |
| 10 AM (10:00) | 10 | 19.23% | 🥉 Late Morning |
| 7 AM (07:00) | 9 | 17.31% | Early Morning |

### 🔍 Key Finding
Thursday's peak is **1 PM (23.08%)** - the only day where lunch hour is the absolute peak.

### 💡 Insight
- Thursday lunch hour is prime time - people preparing for weekend?
- Morning hours (7 AM, 9 AM, 10 AM) combined account for 55% of traffic
- Evening (5 PM) remains strong at 21.15%

### ✅ Action Items
| Priority | Action | Timeline |
|----------|--------|----------|
| 🔴 High | Staff heavily from 9 AM - 2 PM | Immediate |
| 🟡 Medium | Offer extended lunch hour classes | Next week |
| 🟢 Low | Promote "Thursday Lunch Break" specials | Monthly |

---

## 📈 Finding 5: Friday - Afternoon & Lunch Tie

**Data:**

| Hour | Visits | Percentage | Pattern |
|------|--------|------------|---------|
| 4 PM (16:00) | 17 | 22.08% | 🥇 Afternoon |
| 12 PM (12:00) | 17 | 22.08% | 🥇 Lunch |
| 10 AM (10:00) | 15 | 19.48% | 🥈 Late Morning |
| 3 PM (15:00) | 15 | 19.48% | 🥈 Afternoon |
| 6 AM (06:00) | 13 | 16.88% | Early Morning |

### 🔍 Key Finding
Friday shows a **tie for first place** between 4 PM and 12 PM, both at 22.08%.

### 💡 Insight
- People workout during lunch to free up evenings for social plans
- Afternoon (3 PM, 4 PM) combined = 41.56% - "pre-weekend" rush
- Early morning (6 AM) still strong at 16.88%

### ✅ Action Items
| Priority | Action | Timeline |
|----------|--------|----------|
| 🔴 High | Full staff coverage 10 AM - 5 PM | Immediate |
| 🟡 Medium | Offer "Friday Lunch Express" classes | Next week |
| 🟢 Low | Early morning staff reduced slightly | Review monthly |

---

## 📈 Finding 6: Saturday - Late Night Surprise

**Data:**

| Hour | Visits | Percentage | Pattern |
|------|--------|------------|---------|
| 9 PM (21:00) | 16 | 23.19% | 🥇 Late Night |
| 12 PM (12:00) | 14 | 20.29% | 🥈 Lunch |
| 7 AM (07:00) | 13 | 18.84% | 🥉 Early Morning |
| 10 AM (10:00) | 13 | 18.84% | 🥉 Late Morning |
| 3 PM (15:00) | 13 | 18.84% | 🥉 Afternoon |

### 🔍 Key Finding
Saturday's peak is **9 PM (23.19%)** - the only day where late night is the top hour.

### 💡 Insight
- People sleep in, then workout late before going out
- Mid-day (12 PM) remains strong at 20.29%
- Morning hours (7 AM, 10 AM) still attract early risers

### ✅ Action Items
| Priority | Action | Timeline |
|----------|--------|----------|
| 🔴 High | Add evening staff (7 PM - 10 PM) | Immediate |
| 🟡 Medium | Maintain morning coverage (7 AM - 12 PM) | Immediate |
| 🟢 Low | Promote "Saturday Night Workout" specials | Monthly |

---

## 📈 Finding 7: Sunday - Morning Dominance

**Data:**

| Hour | Visits | Percentage | Pattern |
|------|--------|------------|---------|
| 8 AM (08:00) | 17 | 21.79% | 🥇 Peak |
| 5 AM (05:00) | 16 | 20.51% | 🥈 Early Bird |
| 9 AM (09:00) | 16 | 20.51% | 🥈 Morning |
| 11 AM (11:00) | 15 | 19.23% | 🥉 Late Morning |
| 7 PM (19:00) | 14 | 17.95% | Evening |

### 🔍 Key Finding
Sunday is **morning-dominated** with top 4 hours all before noon (5 AM, 8 AM, 9 AM, 11 AM) accounting for 82% of traffic.

### 💡 Insight
- People workout early Sunday to free up rest of day
- 5 AM crowd suggests dedicated members even on weekends
- Evening (7 PM) is minimal - people resting before Monday

### ✅ Action Items
| Priority | Action | Timeline |
|----------|--------|----------|
| 🔴 High | Heavy morning staff (5 AM - 12 PM) | Immediate |
| 🟡 Medium | Minimal evening staff (1-2 people) | Immediate |
| 🟢 Low | Offer "Sunday Morning Fuel" classes | Monthly |

---

## 📊 Summary: Peak Hours by Day

| Day | Morning Peak | Afternoon Peak | Evening Peak | Late Night |
|-----|--------------|----------------|--------------|------------|
| Monday | 5 AM (22%) | 4 PM (23%) | 6 PM (18%) | - |
| Tuesday | 5 AM (23%) | 4 PM (20%) | 6 PM (20%) | 10 PM (17%) |
| Wednesday | 7 AM (25%) | 2 PM (20%) | 7 PM (19%) | - |
| Thursday | 9 AM (19%) | 1 PM (23%) | 5 PM (21%) | - |
| Friday | 6 AM (17%) | 3 PM (19%) | 4 PM (22%) | - |
| Saturday | 7 AM (19%) | 3 PM (19%) | - | 9 PM (23%) |
| Sunday | 8 AM (22%) | - | 7 PM (18%) | - |

---

# ⏰ Time Slot Analysis: Quick Insights for Staff Scheduling

## 📊 Time Slot Overview

| Time Slot | Visits | % | Avg Duration | Unique Members |
|-----------|--------|---|--------------|----------------|
| Early Morning (5-8am) | 305 | **24.4%** | 69 min | 305 |
| Evening (6-9pm) | 261 | **20.9%** | 72 min | 261 |
| Morning (9-11am) | 215 | 17.2% | 71 min | 215 |
| Lunch (12-2pm) | 205 | 16.4% | 67 min | 205 |
| Afternoon (3-5pm) | 203 | 16.2% | 73 min | 203 |
| Late Night (10-11pm) | 61 | 4.9% | **77 min** | 61 |

---

## 🥇 Finding 1: Early Morning is KING

| Metric | Value |
|--------|-------|
| **Visits** | 305 (24.4%) |
| **Rank** | #1 busiest |
| **Duration** | 69 min |

**🔍 Finding**: Early morning (5-8am) is the **busiest time slot** with nearly 1/4 of all visits.

**💡 Insight**: Dedicated early birds drive your business. They're consistent and committed.

**✅ Action**: Staff 4:30am - 9am with **4+ employees**. Have equipment ready.

---

## 🥈 Finding 2: Evening is Strong #2

| Metric | Value |
|--------|-------|
| **Visits** | 261 (20.9%) |
| **Rank** | #2 busiest |
| **Duration** | 72 min |

**🔍 Finding**: Evening (6-9pm) captures another 21% of traffic.

**💡 Insight**: After-work crowd is almost as big as early morning.

**✅ Action**: Staff 5pm - 9:30pm with **3-4 employees**. Focus on strength equipment.

---

## 🥉 Finding 3: Mid-Day is Consistent

| Time Slot | Visits | % |
|-----------|--------|---|
| Morning (9-11am) | 215 | 17.2% |
| Lunch (12-2pm) | 205 | 16.4% |
| Afternoon (3-5pm) | 203 | 16.2% |

**🔍 Finding**: Three mid-day slots are nearly identical (16-17% each).

**💡 Insight**: Steady flow from 9am - 5pm requires consistent coverage.

**✅ Action**: Maintain **2-3 staff** throughout mid-day. No gaps.

---

## 🌙 Finding 4: Late Night - Small but DEDICATED

| Metric | Value |
|--------|-------|
| **Visits** | 61 (4.9%) |
| **Duration** | **77 min** (LONGEST) |

**🔍 Finding**: Late night has fewest visitors (4.9%) but **longest workouts** (77 min).

**💡 Insight**: Late night crowd is small but SERIOUS. They're not casual.

**✅ Action**: Keep **1 staff** 9-11pm. Consider extending hours if demand grows.

---

## ⏱️ Finding 5: Duration vs Volume

| Time Slot | Duration | Volume |
|-----------|----------|--------|
| Late Night | 77 min ⬆️ | Low |
| Afternoon | 73 min | Medium |
| Evening | 72 min | High |
| Morning | 71 min | Medium |
| Early Morning | 69 min | HIGHEST |
| Lunch | 67 min ⬇️ | Medium |

**🔍 Finding**: Lunch has **shortest workouts** (67 min); Late night has **longest** (77 min).

**💡 Insight**: Lunch crowd is rushed; late night crowd takes their time.

**✅ Action**: 
- Lunch: Offer 30-45 min express classes
- Late night: Keep equipment available for long sessions

---

## 📊 Staffing Calculator

| Time Slot | Visits | Staff Needed | Ratio |
|-----------|--------|--------------|-------|
| Early Morning (5-8am) | 305 | **4-5** | 1:70 |
| Morning (9-11am) | 215 | **3** | 1:70 |
| Lunch (12-2pm) | 205 | **3** | 1:70 |
| Afternoon (3-5pm) | 203 | **3** | 1:70 |
| Evening (6-9pm) | 261 | **4** | 1:65 |
| Late Night (10-11pm) | 61 | **1** | 1:60 |

*Assumes 1 staff per 60-70 members*

---

## 🎯 Top 3 Priorities

| Priority | Action | Why |
|----------|--------|-----|
| **1** 🚨 | Staff Early Morning (4:30am-9am) with 4+ people | 24% of ALL traffic |
| **2** 🚨 | Staff Evening (5pm-9:30pm) with 4 people | 21% of traffic |
| **3** ⚠️ | Maintain 3 staff mid-day (9am-5pm) | Steady 50% traffic |

---

# 💪 Workout Preferences Analysis: Quick Insights by Age & Gender

## 📊 Overview Summary

| Age Group | Female Favorite | Male Favorite | Other Favorite |
|-----------|-----------------|---------------|----------------|
| 18-25 | HIIT / Yoga | Strength / CrossFit | CrossFit / HIIT |
| 26-35 | HIIT / Yoga | HIIT / Yoga | Yoga / Strength |
| 36-45 | CrossFit / Cardio | Cardio / Strength | Strength / Cardio |
| 46-55 | Strength / Yoga | Cardio / Yoga | CrossFit / Yoga |
| 56-65 | HIIT / Cardio | Strength / Cardio | CrossFit / Cardio |

---

## 👩 Female Preferences by Age

### Age 18-25
| Top Workouts | % | Avg Duration | Avg Calories |
|--------------|---|--------------|--------------|
| HIIT | 41% | 79 min | 572 |
| Yoga | 33% | 76 min | 579 |
| CrossFit | 17% | 60 min | 407 |

**🔍 Finding**: Young women prefer HIIT (41%) and Yoga (33%)

**💡 Insight**: Mix of high-intensity and flexibility training

**✅ Action**: Schedule morning HIIT + evening Yoga classes

---

### Age 26-35
| Top Workouts | % | Avg Duration | Avg Calories |
|--------------|---|--------------|--------------|
| HIIT | 28% | 78 min | 505 |
| Yoga | 28% | 79 min | 490 |
| Strength | 22% | 56 min | 317 |

**🔍 Finding**: HIIT and Yoga tied for top spot

**💡 Insight**: Balance of intensity and recovery

**✅ Action**: Offer combo memberships (HIIT + Yoga)

---

### Age 36-45
| Top Workouts | % | Avg Duration | Avg Calories |
|--------------|---|--------------|--------------|
| CrossFit | 33% | 77 min | 551 |
| Strength | 25% | 86 min | 760 |
| Cardio | 25% | 70 min | 552 |

**🔍 Finding**: CrossFit emerges as favorite (33%)

**💡 Insight**: Women in this age group seek community + intensity

**✅ Action**: Promote CrossFit classes for this demographic

---

### Age 46-55
| Top Workouts | % | Avg Duration | Avg Calories |
|--------------|---|--------------|--------------|
| Strength | 27% | 65 min | 543 |
| Yoga | 27% | 64 min | 418 |
| HIIT | 27% | 41 min | 368 |

**🔍 Finding**: Three-way tie - very balanced preferences

**💡 Insight**: Variety is key for this age group

**✅ Action**: Offer diverse class schedules

---

### Age 56-65
| Top Workouts | % | Avg Duration | Avg Calories |
|--------------|---|--------------|--------------|
| HIIT | 36% | 72 min | 484 |
| Cardio | 27% | 77 min | 541 |
| Yoga | 18% | 96 min | 763 |

**🔍 Finding**: HIIT remains popular even at older ages!

**💡 Insight**: Active older women still want intensity

**✅ Action**: Create "HIIT for seniors" modified classes

---

## 👨 Male Preferences by Age

### Age 18-25
| Top Workouts | % | Avg Duration | Avg Calories |
|--------------|---|--------------|--------------|
| Strength | 27% | 68 min | 487 |
| CrossFit | 27% | 80 min | 463 |
| HIIT | 9% | 36 min | 328 |

**🔍 Finding**: Strength and CrossFit dominate (54% combined)

**💡 Insight**: Young men want to build muscle

**✅ Action**: Stock heavy weights; offer strength workshops

---

### Age 26-35
| Top Workouts | % | Avg Duration | Avg Calories |
|--------------|---|--------------|--------------|
| HIIT | 30% | 71 min | 599 |
| Cardio | 30% | 79 min | 590 |
| Yoga | 23% | 65 min | 397 |

**🔍 Finding**: HIIT and Cardio tied for top (30% each)

**💡 Insight**: Men in this age focus on fitness + endurance

**✅ Action**: Schedule evening HIIT classes

---

### Age 36-45
| Top Workouts | % | Avg Duration | Avg Calories |
|--------------|---|--------------|--------------|
| Cardio | 33% | 63 min | 421 |
| CrossFit | 25% | 64 min | 609 |
| HIIT | 25% | 71 min | 623 |

**🔍 Finding**: Cardio leads (33%) - heart health focus

**💡 Insight**: Mid-life health awareness increases

**✅ Action**: Promote cardio equipment; heart health workshops

---

### Age 46-55
| Top Workouts | % | Avg Duration | Avg Calories |
|--------------|---|--------------|--------------|
| Cardio | 37% | 86 min | 635 |
| HIIT | 27% | 42 min | 327 |
| Yoga | 9% | 27 min | 187 |

**🔍 Finding**: Cardio dominates (37%) at 46-55

**💡 Insight**: Weight management becomes priority

**✅ Action**: Add more cardio equipment; early morning cardio classes

---

### Age 56-65
| Top Workouts | % | Avg Duration | Avg Calories |
|--------------|---|--------------|--------------|
| Strength | 29% | 71 min | 470 |
| Cardio | 24% | 56 min | 424 |
| HIIT | 24% | 76 min | 538 |

**🔍 Finding**: Strength training #1 for older men

**💡 Insight**: Maintaining muscle mass becomes priority

**✅ Action**: Offer "Strength for seniors" classes

---

# 💳 Workout by Membership: Quick Insights

## Annual Members

| Workout | % | Insight |
|---------|---|---------|
| HIIT | 21.6% | 🟢 Most balanced group |
| Yoga | 21.4% | 🟢 They value variety |
| Strength | 21.4% | 🟢 Not loyal to one workout |
| Cardio | 18.4% | |
| CrossFit | 17.3% | |

**🔍 Finding**: Top 3 workouts within 0.2% - they want VARIETY

**💡 Insight**: Annual members are committed long-term and need cross-training to stay engaged

**✅ Action**: Offer diverse class schedules & "workout rotation" challenges

---

## Monthly Members

| Workout | % | Insight |
|---------|---|---------|
| Cardio | 21.6% | 🟢 Weight loss focus |
| Strength | 20.4% | 🟢 Casual fitness seekers |
| HIIT | 20.4% | 🟢 Easy to upgrade |
| Yoga | 19.0% | |
| CrossFit | 18.7% | |

**🔍 Finding**: Cardio is #1 (21.6%) - weight management priority

**💡 Insight**: Monthly members are price-sensitive but results-focused

**✅ Action**: Promote cardio equipment & "upgrade to annual" savings

---

## Quarterly Members

| Workout | % | Insight |
|---------|---|---------|
| Strength | 22.2% | 🔥 Most intense |
| Cardio | 21.7% | 🔥 Longest workouts (74 min) |
| CrossFit | 20.9% | 🔥 Burn most calories (550) |
| HIIT | 20.4% | |
| Yoga | 15.0% | |

**🔍 Finding**: Love Strength (22.2%). Workout LONGEST & burn MOST calories

**💡 Insight**: Quarterly members are SERIOUS - they maximize their limited time

**✅ Action**: Target for personal training & strength challenges

---

## 📊 Summary

| Membership | #1 Workout | Personality | Strategy |
|------------|------------|-------------|----------|
| Annual | HIIT | Variety seekers | Cross-training programs |
| Monthly | Cardio | Casual, weight focus | Upgrade to annual |
| Quarterly | Strength | Results-driven | Personal training upsell |

---

## 📌 Bottom Line

> **Annual = variety • Monthly = cardio • Quarterly = intensity**

**Sell annual to monthly. Sell PT to quarterly. Keep variety for annual.**

---

# 🚫 No-Show Patterns by Day: Quick Insights

## 📊 No-Show Rate by Day

| Day | Bookings | No-Shows | Rate | Rank |
|-----|----------|----------|------|------|
| Thursday | 325 | 185 | **56.9%** | 🥇 WORST |
| Monday | 384 | 204 | **53.1%** | 🥈 |
| Wednesday | 374 | 197 | **52.7%** | 🥉 |
| Tuesday | 368 | 192 | 52.2% | |
| Saturday | 383 | 192 | 50.1% | |
| Friday | 392 | 195 | 49.7% | |
| Sunday | 374 | 185 | 49.5% | 🏆 BEST |

---

## 📈 Finding 1: Thursday is the WORST

| Metric | Value |
|--------|-------|
| No-Show Rate | **56.9%** |
| Rank | #1 highest |
| vs Best Day | +7.4% worse than Sunday |

**🔍 Finding**: Thursday has the highest no-show rate (56.9%) - more than half of bookings don't show.

**💡 Insight**: People book Thursday sessions but "pre-weekend" plans cause cancellations.

**✅ Action**: 
- Send double reminders on Thursday mornings
- Offer Thursday incentives (small reward for showing)
- Overbook Thursday by 15%

---

## 📈 Finding 2: Sunday is the BEST

| Metric | Value |
|--------|-------|
| No-Show Rate | **49.5%** |
| Rank | #1 lowest |
| vs Worst Day | +7.4% better than Thursday |

**🔍 Finding**: Sunday has the lowest no-show rate (49.5%) - still high, but best of the week.

**💡 Insight**: People who book Sunday are committed - they're starting their week prepared.

**✅ Action**: 
- Sunday is reliable - don't overbook
- Use Sunday as model to understand commitment factors

---

## 📈 Finding 3: Weekdays vs Weekends

| Period | Avg No-Show Rate |
|--------|------------------|
| Weekdays (Mon-Fri) | 52.9% |
| Weekends (Sat-Sun) | 49.8% |

**🔍 Finding**: Weekdays have **3.1% higher** no-show rate than weekends.

**💡 Insight**: Weekend warriors are more committed. Weekday plans get disrupted by work/life.

**✅ Action**: 
- Stricter cancellation policy on weekdays
- Offer "morning of" booking discounts for weekdays

---

## 📈 Finding 4: The Friday Exception

| Day | Rate | vs Average |
|-----|------|------------|
| Friday | 49.7% | -2.8% |

**🔍 Finding**: Friday (49.7%) is better than most weekdays - almost weekend-level commitment.

**💡 Insight**: People keep Friday fitness commitments before weekend social plans.

**✅ Action**: Promote Friday as "Commitment Day" - use in marketing

---

## 📊 Day Rankings

| Rank | Day | Rate | Verdict |
|------|-----|------|---------|
| 🏆 BEST | Sunday | 49.5% | Most reliable |
| 🥈 | Friday | 49.7% | Strong |
| 🥉 | Saturday | 50.1% | Good |
| 4 | Tuesday | 52.2% | Risky |
| 5 | Wednesday | 52.7% | Risky |
| 6 | Monday | 53.1% | Bad |
| 🚨 WORST | Thursday | 56.9% | Crisis |

---

## 🎯 Key Insights Summary

| # | Insight | Action |
|---|---------|--------|
| 1 | **Thursday (56.9%)** is the worst - people flake before weekend | Double reminders + incentives |
| 2 | **Sunday (49.5%)** is best - committed members | Don't overbook, reward reliability |
| 3 | Weekdays (52.9%) worse than weekends (49.8%) | Stricter weekday policy |
| 4 | Friday (49.7%) is surprisingly good | Use in marketing |

---

## ✅ Action Plan by Day

| Day | No-Show Rate | Strategy |
|-----|--------------|----------|
| Monday | 53.1% | Send Monday morning reminder |
| Tuesday | 52.2% | Standard reminder |
| Wednesday | 52.7% | Standard reminder |
| Thursday | **56.9%** | 🚨 Double reminder + incentive |
| Friday | 49.7% | Promote "Finish Strong Friday" |
| Saturday | 50.1% | Standard reminder |
| Sunday | **49.5%** | Reward reliability |

---

## 📌 Bottom Line

> **Thursday is the problem child. Sunday is the golden child. Treat them differently.**

**Thursday = double down on reminders • Sunday = reward reliability**

---

# 🚫 No-Show Patterns by Membership: Quick Insights

## 📊 No-Show Rate by Membership

| Membership | Bookings | No-Shows | Rate | Avg Duration |
|------------|----------|----------|------|--------------|
| Quarterly | 841 | 453 | **53.9%** | 71.4 min |
| Annual | 903 | 463 | **51.3%** | 69.9 min |
| Monthly | 856 | 434 | **50.7%** | 69.2 min |

---

## 📈 Finding 1: Quarterly Members = WORST Offenders

| Metric | Value |
|--------|-------|
| No-Show Rate | **53.9%** (highest) |
| Duration | 71.4 min (longest) |

**🔍 Finding**: Quarterly members no-show most (53.9%) but book longest workouts (71.4 min).

**💡 Insight**: They're serious WHEN they show, but least committed to showing up.

**✅ Action**: 
- Require credit card on file
- Charge fee for no-shows
- Send 3 reminders (24hr, 2hr, 1hr before)

---

## 📈 Finding 2: Monthly Members = MOST Reliable

| Metric | Value |
|--------|-------|
| No-Show Rate | **50.7%** (lowest) |
| Duration | 69.2 min (shortest) |

**🔍 Finding**: Monthly members show up most (50.7% no-show) but book shortest workouts.

**💡 Insight**: They're consistent but casual - value convenience over intensity.

**✅ Action**: 
- Reward with "perfect attendance" discounts
- Target for annual upgrade

---

## 📈 Finding 3: Annual Members = MIDDLE Ground

| Metric | Value |
|--------|-------|
| No-Show Rate | **51.3%** (middle) |
| Duration | 69.9 min (middle) |

**🔍 Finding**: Annual members are exactly average - neither best nor worst.

**💡 Insight**: Long-term commitment doesn't guarantee attendance.

**✅ Action**: 
- Engagement campaigns to remind why they joined
- Referral rewards to bring friends

---

## 📊 Ranking

| Rank | Membership | No-Show Rate | Verdict |
|------|------------|--------------|---------|
| 🏆 BEST | Monthly | 50.7% | Most reliable |
| 🥈 | Annual | 51.3% | Average |
| 🚨 WORST | Quarterly | 53.9% | Least reliable |

---

## 🎯 Key Insights

| Membership | Problem | Insight | Action |
|------------|---------|---------|--------|
| Quarterly | 53.9% no-show | Serious but flaky | Charge no-show fees |
| Annual | 51.3% no-show | Forgot why they joined | Engagement campaigns |
| Monthly | 50.7% no-show | Consistent but casual | Reward & upgrade |

---

## ✅ Action Plan

| Membership | Strategy |
|------------|----------|
| **Quarterly** | 🔴 Credit card required. No-show fee. Triple reminders. |
| **Annual** | 🟡 Re-engagement emails. Referral rewards. |
| **Monthly** | 🟢 Perfect attendance discount. Target for upgrade. |

---

## 📌 Bottom Line

> **Quarterly = serious but flaky • Monthly = reliable but casual • Annual = forgot why they joined**

**Treat each membership type differently.**

---

# ⏱️ Workout Duration Factors: Quick Insights

## 📊 Duration & Calories by Workout Type

| Workout | Avg Duration | Avg Calories | Sessions | Calories/Min |
|---------|--------------|--------------|----------|--------------|
| Yoga | **72.1 min** ⬆️ | 523 | 232 | 7.3 |
| Strength | 71.7 min | 535 | **266** ⬆️ | 7.5 |
| Cardio | 71.5 min | **539** ⬆️ | 256 | **7.5** ⬆️ |
| CrossFit | 70.6 min | 528 | 236 | 7.5 |
| HIIT | 68.1 min ⬇️ | 499 ⬇️ | 260 | 7.3 |

---

## 📈 Finding 1: Yoga = LONGEST Duration

| Metric | Value |
|--------|-------|
| Duration | **72.1 min** (#1 longest) |
| Calories/Min | 7.3 (lowest) |

**🔍 Finding**: Yoga sessions are longest (72.1 min) but burn least per minute.

**💡 Insight**: Yoga is for recovery/flexibility, not calorie burning.

**✅ Action**: 
- Schedule Yoga as recovery day option
- Don't market Yoga for weight loss

---

## 📈 Finding 2: Cardio = HIGHEST Calories

| Metric | Value |
|--------|-------|
| Calories | **539** (#1 highest) |
| Calories/Min | **7.5** (tied best) |

**🔍 Finding**: Cardio burns most calories (539) and is most efficient per minute.

**💡 Insight**: Cardio is optimal for weight loss goals.

**✅ Action**: 
- Promote Cardio for weight loss
- Keep cardio equipment well-maintained

---

## 📈 Finding 3: HIIT = SHORTEST Duration

| Metric | Value |
|--------|-------|
| Duration | **68.1 min** (#1 shortest) |
| Calories | 499 (lowest) |

**🔍 Finding**: HIIT is shortest (68.1 min) and burns least total calories.

**💡 Insight**: HIIT is for time-efficient workouts, not max calorie burn.

**✅ Action**: 
- Market HIIT to busy professionals
- Position as "quick but effective"

---

## 📈 Finding 4: Strength = MOST Popular

| Metric | Value |
|--------|-------|
| Sessions | **266** (#1 most) |
| Duration | 71.7 min |

**🔍 Finding**: Strength training has highest session count (266).

**💡 Insight**: Strength training is the most consistent preference.

**✅ Action**: 
- Maintain plenty of strength equipment
- Offer strength workshops

---

## 📊 Rankings

| Category | Winner | Loser |
|----------|--------|-------|
| Longest Duration | Yoga (72.1 min) | HIIT (68.1 min) |
| Most Calories | Cardio (539) | HIIT (499) |
| Most Efficient | Cardio/Strength (7.5 cal/min) | Yoga/HIIT (7.3) |
| Most Popular | Strength (266 sessions) | Yoga (232) |

---

## 🎯 Key Insights

| Workout | Best For | Worst For | Action |
|---------|----------|-----------|--------|
| Yoga | Flexibility | Calorie burn | Schedule as recovery |
| Strength | Building muscle | - | Maintain equipment |
| Cardio | Weight loss | - | Promote for fat loss |
| CrossFit | Community | - | Keep classes social |
| HIIT | Time efficiency | Total calories | Market to busy people |

---

## ✅ Action Plan

| Workout | Strategy |
|---------|----------|
| Yoga | Position as recovery, not weight loss |
| Strength | Keep equipment stocked. Offer workshops. |
| Cardio | Promote for weight loss. Maintain machines. |
| CrossFit | Emphasize community aspect |
| HIIT | Target busy professionals. "Quick but effective" |

---

## 📌 Bottom Line

> **Yoga = longest • Cardio = most calories • HIIT = shortest • Strength = most popular**

**Match marketing to what each workout actually delivers.**

---

# 📅 Seasonal & Monthly Patterns: Quick Insights

## 📊 Monthly Overview

| Month | Visits | Duration | Calories | Members | vs Prev |
|-------|--------|----------|----------|---------|---------|
| Jan | 98 | 70.6 | 523 | 98 | - |
| Feb | 92 ⬇️ | 67.5 | 510 | 92 | -6.1% |
| Mar | 88 ⬇️ | 67.8 | 500 | 88 | -4.3% |
| **Apr** | **109 ⬆️** | **74.6** | **553** | **109** | **+23.9%** |
| May | 103 | 75.1 | 547 | 103 | -5.5% |
| Jun | 88 ⬇️ | 67.6 | 501 | 88 | -14.6% |
| Jul | 100 | 72.8 | 564 | 100 | +13.6% |
| Aug | 109 | 71.5 | 522 | 109 | +9.0% |
| Sep | 113 | 70.5 | 515 | 113 | +3.7% |
| Oct | 117 | 71.4 | 541 | 117 | +3.5% |
| Nov | 111 | 73.3 | 526 | 111 | -5.1% |
| **Dec** | **122 ⬆️** | 65.7 ⬇️ | 490 ⬇️ | **122** | **+9.9%** |

---

## 📈 Finding 1: April = BIGGEST Growth

| Metric | Value |
|--------|-------|
| Visits | 109 (+23.9% vs March) |
| Duration | 74.6 min (2nd highest) |
| Calories | 553 (2nd highest) |

**🔍 Finding**: April has the **highest month-over-month growth** (+23.9%) with long, intense workouts.

**💡 Insight**: Spring weather = renewed fitness motivation. "New Year, but actually committed now."

**✅ Action**: 
- Launch Spring Fitness Challenge in April
- Heavy marketing starting late March

---

## 📈 Finding 2: December = MOST Visits, SHORTEST Workouts

| Metric | Value |
|--------|-------|
| Visits | **122** (peak of year) |
| Duration | **65.7 min** (lowest of year) |
| Calories | **490** (lowest of year) |

**🔍 Finding**: December has **most visitors** but **shortest, least intense workouts**.

**💡 Insight**: People squeeze in quick workouts between holiday events. Guilt-driven visits.

**✅ Action**: 
- Offer "30-min Express" classes in December
- Don't expect intensity - focus on retention

---

## 📈 Finding 3: February-March = LOW Season

| Month | Visits | Change |
|-------|--------|--------|
| February | 92 | -6.1% |
| March | 88 | -4.3% |
| June | 88 | -14.6% |

**🔍 Finding**: Feb, Mar, and June are lowest months (88 visits each).

**💡 Insight**: Post-New Year resolution fade + summer vacation start.

**✅ Action**: 
- Feb/Mar: Re-engagement campaigns for resolutioners who quit
- June: "Pre-summer shape-up" promos

---

## 📈 Finding 4: Fall = Consistent Strength

| Month | Visits | Trend |
|-------|--------|-------|
| September | 113 | +3.7% |
| October | 117 | +3.5% |
| November | 111 | -5.1% |

**🔍 Finding**: Sept-Nov is **consistently high** (110+ visits/month).

**💡 Insight**: Back-to-school routine + pre-holiday fitness push.

**✅ Action**: 
- Maintain full staff through fall
- Launch annual membership drive

---

## 📊 Seasonal Summary

| Season | Months | Avg Visits | Pattern |
|--------|--------|------------|---------|
| ❄️ Winter | Jan-Mar | 93 | Resolution drop-off |
| 🌸 Spring | Apr-Jun | 100 | April surge, June slump |
| ☀️ Summer | Jul-Aug | 105 | Consistent |
| 🍂 Fall | Sep-Nov | 114 | STRONGEST season |
| 🎄 Holiday | Dec | 122 | Peak visits, shortest workouts |

---

## 🎯 Key Insights

| # | Finding | Insight | Action |
|---|---------|---------|--------|
| 1 | **April** has +23.9% growth | Spring = renewed motivation | Spring Challenge campaign |
| 2 | **December** = most visits (122) but shortest workouts (65.7 min) | Holiday guilt visits | Offer express classes |
| 3 | **Feb/Mar** = lowest (88) | Resolutioners quit | Re-engagement emails |
| 4 | **Fall** = strongest season (114 avg) | Routine is set | Annual membership push |
| 5 | **June** slump (-14.6%) | Summer vacations start | Pre-summer promos |

---

## ✅ Action Plan by Month

| Month | Strategy |
|-------|----------|
| January | Capture resolutioners. Onboard aggressively. |
| February | Re-engage fading resolutioners. Retention focus. |
| March | Pre-spring teasers. "Get ready for April" |
| **April** | 🚀 **LAUNCH SPRING CHALLENGE. Heavy marketing.** |
| May | Maintain momentum. Referral rewards. |
| June | "Pre-summer shape-up" promos. Combat vacation slump. |
| July | Summer specials. Family memberships. |
| August | Back-to-school prep. Student discounts. |
| September | Annual membership drive. Full staffing. |
| October | Maintain. Pre-holiday push. |
| November | "Get holiday ready" campaigns. |
| **December** | 🎄 **Express classes. Focus on retention, not intensity.** |

---

## 📌 Bottom Line

> **April = spring surge • Fall = strongest season • December = peak visits, shortest workouts • Feb/Mar = danger zone**

**Market to the season. Staff accordingly.**

---

# 👥 Age & Gender Workout Preferences: Quick Insights

## 📊 Summary by Age Group

| Age | Female Favorite | Male Favorite | Other Favorite |
|-----|-----------------|---------------|----------------|
| 18-25 | HIIT / Yoga | CrossFit / HIIT | CrossFit / Cardio |
| 26-35 | HIIT / Yoga | HIIT / Cardio | HIIT / Yoga |
| 36-45 | CrossFit / Cardio | Cardio / Strength | Strength / Cardio |
| 46-55 | Cardio / Yoga | Cardio / Strength | HIIT / CrossFit |
| 56-65 | HIIT / CrossFit | HIIT / Strength | CrossFit / Cardio |

---

## 👩 Female: Top Workout by Age

| Age | Favorite | Duration | Calories |
|-----|----------|----------|----------|
| 18-25 | HIIT | 76 min | 574 |
| 26-35 | HIIT | 70 min | 472 |
| 36-45 | CrossFit | 77 min | 551 |
| 46-55 | Cardio | 64 min | 451 |
| 56-65 | HIIT | 85 min | 588 |

**🔍 Finding**: HIIT dominates across all ages. CrossFit peaks at 36-45.

**💡 Insight**: Women want intensity at every age - just different formats.

**✅ Action**: Offer HIIT daily. Add CrossFit for 30s-40s.

---

## 👨 Male: Top Workout by Age

| Age | Favorite | Duration | Calories |
|-----|----------|----------|----------|
| 18-25 | CrossFit | 63 min | 426 |
| 26-35 | HIIT | 77 min | 624 |
| 36-45 | Cardio | 74 min | 634 |
| 46-55 | Cardio | 66 min | 477 |
| 56-65 | HIIT | 89 min | 682 |

**🔍 Finding**: Young men = CrossFit. Middle age = Cardio. Older = HIIT.

**💡 Insight**: Priorities shift: muscle → heart health → active aging.

**✅ Action**: 
- 20s: CrossFit classes
- 30s-40s: Cardio equipment
- 50s+: HIIT for seniors

---

## 🧑 Other: Top Workout by Age

| Age | Favorite | Duration | Calories |
|-----|----------|----------|----------|
| 18-25 | CrossFit | 61 min | 450 |
| 26-35 | Yoga | 90 min | 594 |
| 36-45 | Strength | 74 min | 610 |
| 46-55 | HIIT | 68 min | 493 |
| 56-65 | CrossFit | 82 min | 604 |

**🔍 Finding**: CrossFit popular young & old. Yoga peaks at 26-35.

**💡 Insight**: This group seeks community (CrossFit) and wellness (Yoga).

**✅ Action**: Promote inclusive environment. Schedule both CrossFit and Yoga.

---

## 🏆 Most Consistent Preferences

| Group | Most Consistent | Across Ages |
|-------|-----------------|-------------|
| Female | HIIT | 18-65 |
| Male | Cardio | 26-55 |
| Other | CrossFit | 18-65 |

---

## 📈 Duration & Intensity Leaders

| Metric | Winner | Value |
|--------|--------|-------|
| Longest Workout | Other (26-35 Yoga) | 90 min |
| Highest Calories | Male (56-65 HIIT) | 682 |
| Most Visits | Female (57) / Other (57) | 15 members |
| Shortest Workout | Female (55) | 43 min |

---

## 🎯 Key Insights by Gender

| Gender | They Want | Action |
|--------|-----------|--------|
| Female | HIIT (all ages) | Daily HIIT classes |
| Male | CrossFit (20s), Cardio (30s-50s), HIIT (60s) | Age-specific marketing |
| Other | CrossFit + Yoga | Inclusive community focus |

---

## ✅ Action Plan by Age

| Age | What They Want | What You Do |
|-----|----------------|-------------|
| 18-25 | HIIT, CrossFit | Evening classes. Heavy weights. |
| 26-35 | HIIT, Cardio | Mix intensity + cardio equipment |
| 36-45 | CrossFit, Cardio | Community-focused classes |
| 46-55 | Cardio, Yoga | Heart health + flexibility |
| 56-65 | HIIT, CrossFit | Modified intensity for seniors |

---

## 📌 Bottom Line

> **HIIT is universal. CrossFit builds community. Cardio is middle-age king. Yoga is for recovery.**

**Market by age group, not one-size-fits-all.**

---

## 👇Full SQL query code analysis👇

-<a href="https://github.com/Donovandonz/SQL--gym-attendance-analysis/blob/main/Gym_analysisSQL_db.sql">Gym-analysis-SQL-query-code</a>


---

## Dashboard Overview (Tableau)👇
-<a href="https://github.com/Donovandonz/Tableau--gym-behavior-analysis-dashboard">Gym-behavior-analysis-dashboard</a>

<img width="1999" height="1124" alt="Gym Analysis Dashboard" src="https://github.com/user-attachments/assets/b4c450bd-f7f3-47f2-827f-a93939045062" />



