require 'rails_helper'

RSpec.describe 'the student index page' do 

# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes

# User Story 8, Child Index Link

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index

# User Story 9, Parent Index Link

# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index

    it 'displays the name of each student' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                ap_program: false)                          
        student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
        student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)

    visit '/students'

    expect(page).to have_content(student.name)
    end

    it 'displays true/false if the student is part of the honor roll' do
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
        student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
        student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)

    visit '/students'

    expect(page).to have_content(student.honor_roll)
    end

    it 'displays the student class rank' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                ap_program: false)                          
        student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
        student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
    
        visit '/students'

        expect(page).to have_content(student.class_rank)

    end

    it 'displays the school id associated with the student' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
        student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
        student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)

        visit '/students'

        expect(page).to have_content(student.school_id)
    end

    it 'displays a link at the top of the page that takes user to the students index page' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
        student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
        student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
        
        visit '/students'
        click_link "Students"

        expect(page).to have_link("Students")
    end

    it 'displays a link at the top of the page that takes user to the schools index page' do 
        school = School.create!(name: "Lemonade High School", national_rank: 12, 
                                ap_program: true)
        school_2 = School.create!(name: "Watermelon High School", national_rank: 19,
                                    ap_program: false)                          
        student = school.students.create!(name: "Mira", honor_roll: true, class_rank: 4)
        student_2 = school_2.students.create!(name: "Ellen", honor_roll: true, class_rank: 29)
            
        visit '/students'
        click_link "Schools"
            
        expect(page).to have_link("Schools")
        expect(current_path).to eq('/schools')
    end
end