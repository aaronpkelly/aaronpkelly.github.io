# Development 
This article Encompasses all parts of development:

- [[Software Development]]
- [[Web development]]

The sections below apply to all aspects of development work

# High-level best practices
- every project should be version controlled - in [[git]] preferably
- every project should describe what it is and how it's built. Include a `README.md`, `Dockerfile` or a `.build.yml` for everything. Don't assume you or your readers will "remember" or "just understand" the point of the project. Time passes and you forget
	- using containerisation meansyou can SWITCH cloud providers easily, all you need is cloud compute + docker
- ideally, use [[tdd]] to drive all development. If you're just having fun/hacking/making a proof-of-concept, don't worry - just have fun. But if it gets serious... write them tests
- every commit should trigger a test, build, and deploy loop -this is [[cicd]] baby! If you're working on a project this loop is essential to keep you interested. DEPLOY IT. MAKE IT RUN. MAKE IT REAL
- use LISTS and ISSUE TRACKERS for tracking your progress on each of your projects. I use the tools on [[sr.ht]] 
- use markdown to keep track of your thought on every topic. These notes will be like a second brain. Use a tool to help you organise these thoughts - I like Obsidian
	- ideally, when writing, every post should be written like it will become a blog post one day
- host as many of your projects on on cheap/free-tier sites like
	- github pages (it can run HTML5+CSS+JS!)
	- s3 static website hosting (JS also)
- if hosting your project on a paid service or platform, make sure it's easy to migrate your work to another host (again, stick to [[Docker]] if possible)

# See also

[[Instant coding answers]]

[[Game Development]]