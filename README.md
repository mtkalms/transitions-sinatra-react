# Transititions: Sinatra → React

As part of my **Transitions** series, this repository explores the transition of a pure sinatra web application into a modern React application with a Sinatra API backend.

**Transitions:** Most applications will at some point face larger architectural changes, to keep up with changing requirements. Often it is simply not feasable to rewrite or restructure the entire application in one herculean task. More likely, these transitions will happen gradually in a matter of weeks, months or even years. During this time, pragmatic solutions have to be found that allow both solutions to work at the same time.

## Challenge

During the transition, parts of the frontend have already been transferred to React, while the rest are still Sinatra pages. The challange is to deliver both parts seemlessly in the same application with shared components (menu, sidebar, footer, ...) and styles.

## Usage

### Database

To run the migrations

```bash
rake db:migrate
```

### Backend

To run the sinatra application:

```bash
cd backend
rackup
```

To run the sinatra application and rerun on file system changes:

```bash
cd backend
rerun rackup
```
