# Movie Star - Entity-Relationship Database Design

A relational database design for the "Movie Star" anime movie-directing simulation game, developed using MySQL Workbench as part of the Database Design course.

## Project Overview

"Movie Star" allows players to act as directors, creating and directing custom anime movies by selecting scripts, actors, and movie genres. Successful movies gain engagement through social media likes, helping directors enter the Pantheon of top creators. 

## Key Features

- **Game Sessions & Directors:** Supports multiple independent game sessions and directors per player, tracking age, nationalities, and inspirations.
- **Movie Types & Sets:** Manages domestic and international movies, handling country-specific sets, filming locations, and production companies.
- **AI Scripts:** Incorporates AI-generated scripts consisting of sequential text fragments that track preceding text history.
- **Actors & Training:** Comprehensive tracking of actor details, contracts, roles, physical/mental/technical qualities, and specialized training programs.
- **Festivals & Social Media:** Manages film festivals, competitive awards, social network pages, director friendships, and audience likes.

## Design Choices & Assumptions

- **Domestic vs. International Movies:** Movies are split into domestic and international entities to properly link sets for domestic films while allowing multi-country shooting for international counterparts.
- **Consolidated Characteristics:** Actor characteristics are grouped into a single unified entity linked via a category table to keep the schema clean and maintainable.
- **Independent Roles:** The actor's role is modeled as a separate entity rather than a simple attribute, allowing actors to participate across multiple movies with different roles.
- **Social Media Tracking:** Directors and movies are directly linked to social networks to accurately record interactions like likes and online friendships.

## Files Included

- **`final.mwb`:** MySQL Workbench model file containing the complete E-R diagram.
- **`final.sql`:** Forward-engineered SQL script for generating the database schema.
