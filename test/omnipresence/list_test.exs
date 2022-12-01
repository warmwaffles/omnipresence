defmodule Omnipresence.ListTest do
  use ExUnit.Case, async: true

  describe "present?/1" do
    test "[]" do
      refute Omnipresence.present?([])
    end

    test "[nil]" do
      assert Omnipresence.present?([nil])
    end

    test "[1,2,3]" do
      assert Omnipresence.present?([1, 2, 3])
    end
  end

  describe "blank?/1" do
    test "[]" do
      assert Omnipresence.blank?([])
    end

    test "[nil]" do
      refute Omnipresence.blank?([nil])
    end

    test "[1,2,3]" do
      refute Omnipresence.blank?([1, 2, 3])
    end
  end

  describe "presence/1" do
    test "[]" do
      assert Omnipresence.presence([]) == nil
    end

    test "[nil]" do
      assert Omnipresence.presence([nil]) == [nil]
    end

    test "[1,2,3]" do
      assert Omnipresence.presence([1, 2, 3]) == [1, 2, 3]
    end
  end
end
