defmodule Omnipresence.AtomTest do
  use ExUnit.Case, async: true

  describe "present?/1" do
    test "nil" do
      refute Omnipresence.present?(nil)
      refute Omnipresence.present?(nil)
    end

    test "true" do
      assert Omnipresence.present?(true)
      assert Omnipresence.present?(true)
    end

    test "false" do
      refute Omnipresence.present?(false)
      refute Omnipresence.present?(false)
    end

    test ":foo" do
      assert Omnipresence.present?(:foo)
    end

    test "module name" do
      assert Omnipresence.present?(__MODULE__)
    end
  end

  describe "blank?/1" do
    test "nil" do
      assert Omnipresence.blank?(nil)
      assert Omnipresence.blank?(nil)
    end

    test "true" do
      refute Omnipresence.blank?(true)
      refute Omnipresence.blank?(true)
    end

    test "false" do
      assert Omnipresence.blank?(false)
      assert Omnipresence.blank?(false)
    end

    test ":foo" do
      refute Omnipresence.blank?(:foo)
    end

    test "module name" do
      refute Omnipresence.blank?(__MODULE__)
    end
  end

  describe "presence/1" do
    test "nil" do
      assert Omnipresence.presence(nil) == nil
    end

    test "true" do
      assert Omnipresence.presence(true) == true
    end

    test "false" do
      assert Omnipresence.presence(false) == nil
    end

    test ":foo" do
      assert Omnipresence.presence(:foo) == :foo
    end

    test "module name" do
      assert Omnipresence.presence(__MODULE__) == __MODULE__
    end
  end
end
