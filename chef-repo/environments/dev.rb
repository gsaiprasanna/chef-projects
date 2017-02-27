name "dev"
description "For developers!"
cookbook "apache", "= 0.2.0"
override_attributes({
	"author" => {
		"name" => "my new author name"
	}
		
})
