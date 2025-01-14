module ApplicationHelper
  def body_class
    kid_signed_in? ? "signed-in" : ""
  end
end
