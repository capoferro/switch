require 'spec_helper'

describe Switch do
  it "should allow fallthrough" do
    a = 0
    switch(:three) do
      match(:one) {
        a += 1
      }
      match(:two) {
        a += 1
      }
      match(:three) {
        a += 1
      }
      match(:four) {
        a += 1
      }
      match(:five) {
        a += 1
      }
      all {
        a += 1
      }
    end

    a.should == 4
  end

  it "should respect break statements" do
    a = 0
    switch(:three) do
      match(:one) {
        a += 1
      }
      match(:two) {
        a += 1
      }
      match(:three) {
        a += 1
      }
      match(:four) {
        a += 1
        break
      }
      match(:five) {
        a += 1
      }
      all {
        a += 1
      }
    end

    a.should == 2
  end

  it "should allow blank matchers" do
    a = 0
    switch(:two) do
      match(:one)
      match(:two)
      match(:three) {
        a += 1
      }
      all {
        a += 1
      }
    end

    a.should == 2
  end

    
end
