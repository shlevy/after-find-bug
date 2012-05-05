Under peculiar circumstances, Rails claims that model instances don't have
the attributes associated with their columns (except for id).

The most relevant commits are <a href="https://github.com/shlevy/after-find-bug/commit/87dca4968c4c4d5853451bd6494e1b755fedf620">87dca4968c4c4d5853451bd6494e1b755fedf620</a> and <a href="https://github.com/shlevy/after-find-bug/commit/6a20ec43d0f3b840c4cc9260fc3931fc48a067c4">6a20ec43d0f3b840c4cc9260fc3931fc48a067c4</a>

To reproduce:

Checkout this project  
bundle install  
bundle exec rake db:schema:load  
rails c:  

	m = Milestone.new
	m.project = Project.create name: "Test Project"
	m.save
	#Next line produces ActiveModel::MissingAttributeError for billing_invoice  
	Milestone.find 1, include: [project: [:time_logs]], order: "projects.name"  
	#Next line works fine  
	Milestone.all conditions: "milestones.id = 1", include: [project: [:time_logs]], order: "projects.name"
