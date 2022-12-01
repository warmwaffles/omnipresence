defmodule Omnipresence.IntegerTest do
  use ExUnit.Case, async: true

  describe "present?/1" do
    test "0" do
      assert Omnipresence.present?(0)
    end

    test "9000" do
      assert Omnipresence.present?(9000)
    end
  end

  describe "blank?/1" do
    test "0" do
      refute Omnipresence.blank?(0)
    end

    test "9000" do
      refute Omnipresence.blank?(9000)
    end
  end

  describe "presence/1" do
    test "0" do
      assert Omnipresence.presence(0) == 0
    end

    test "9000" do
      assert Omnipresence.presence(9000) == 9000
    end
  end
end
